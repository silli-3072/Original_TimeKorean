//
//  GameViewController.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/13.
//

import UIKit
import AVFoundation
import RealmSwift

class GameViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var quizButton1: UIButton!
    @IBOutlet var quizButton2: UIButton!
    @IBOutlet var quizButton3: UIButton!
    @IBOutlet var quizButton4: UIButton!
    @IBOutlet var quizButton5: UIButton!
    @IBOutlet var quizButton6: UIButton!
    
    var time = 30
    var timer = Timer()
    
    var answer = ""
    
    var score = 0
    
    let goodSound = try!AVAudioPlayer(data: NSDataAsset(name: "good")!.data)
    let budSound = try!AVAudioPlayer(data: NSDataAsset(name: "bud")!.data)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generationQuiz()
        
        timerLabel.text = String(time)
        timeraction()
        
        self.quizButton1.layer.cornerRadius = 30
        self.quizButton2.layer.cornerRadius = 30
        self.quizButton3.layer.cornerRadius = 30
        self.quizButton4.layer.cornerRadius = 30
        self.quizButton5.layer.cornerRadius = 30
        self.quizButton6.layer.cornerRadius = 30
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resetGame()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Result" {
            let nextView = segue.destination as! ResultViewController
            
            nextView.score = scoreLabel.text!
        }
    }
    
    func timeraction() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.time -= 1
            self.timerLabel.text = String(self.time)
            
            if self.time == 0 {
                timer.invalidate()
                self.performSegue(withIdentifier: "Result", sender: nil)
                
            }
            
        })
        
    }
    
    @IBAction func quizButton1Tapped() {
        let buttonText1 = quizButton1.currentTitle!
        
        checkAnswer(text: buttonText1)
        generationQuiz()
        
    }
    
    @IBAction func quizButton2Tapped() {
        let buttonText2 = quizButton2.currentTitle!
        
        checkAnswer(text: buttonText2)
        generationQuiz()
        
    }
    
    @IBAction func quizButton3Tapped() {
        let buttonText3 = quizButton3.currentTitle!
        
        checkAnswer(text: buttonText3)
        generationQuiz()
        
    }
    
    @IBAction func quizButton4Tapped() {
        let buttonText4 = quizButton4.currentTitle!
        
        checkAnswer(text: buttonText4)
        generationQuiz()
        
    }
    
    @IBAction func quizButton5Tapped() {
        let buttonText5 = quizButton5.currentTitle!
        
        checkAnswer(text: buttonText5)
        generationQuiz()
        
    }
    
    @IBAction func quizButton6Tapped() {
        let buttonText6 = quizButton6.currentTitle!
        
        checkAnswer(text: buttonText6)
        generationQuiz()
        
    }
    
    func generationQuiz() {
        let userData = realm.objects(Word.self)
        
        let randomValue = userData.randomElement()
        
        answer = randomValue!.korean
        print("🍑",answer)
        
        let choiceValue1 = userData.randomElement()
        let choiceValue2 = userData.randomElement()
        let choiceValue3 = userData.randomElement()
        let choiceValue4 = userData.randomElement()
        let choiceValue5 = userData.randomElement()
        
        let choiceValueArray = [choiceValue1,choiceValue2,choiceValue3,choiceValue4,choiceValue5,randomValue]
        let newchoiceValueArray = choiceValueArray.shuffled()
        
        questionLabel.text = "\(randomValue!.japanese)"
        quizButton1.setTitle("\(newchoiceValueArray[0]!.korean)", for: .normal)
        quizButton2.setTitle("\(newchoiceValueArray[1]!.korean)", for: .normal)
        quizButton3.setTitle("\(newchoiceValueArray[2]!.korean)", for: .normal)
        quizButton4.setTitle("\(newchoiceValueArray[3]!.korean)", for: .normal)
        quizButton5.setTitle("\(newchoiceValueArray[4]!.korean)", for: .normal)
        quizButton6.setTitle("\(newchoiceValueArray[5]!.korean)", for: .normal)
        
    }
    
    func checkAnswer(text: String) {
        if text == answer {
            score = score + 10
            scoreLabel.text = "\(score)"
            
            goodSound.currentTime = 0
            goodSound.play()
            
        } else {
            time = time - 1
            self.timerLabel.text = String(self.time)
            
            budSound.currentTime = 0
            budSound.play()
            
            updateGame()
            
            //Thread.sleep(forTimeInterval: 1.0)
        }
    }
    
    func updateGame() {
        if time <= 0 {
            time = 0
            scoreLabel.text = "\(score)"
            self.performSegue(withIdentifier: "Result", sender: nil)
        }
    }
    
    func resetGame() {
        time = 30
        score = 0
        
        timerLabel.text = "\(time)"
        scoreLabel.text = "\(score)"
        
        if timer.isValid == false {
            timeraction()
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
