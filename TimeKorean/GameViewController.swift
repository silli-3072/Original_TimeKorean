//
//  GameViewController.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/13.
//

import UIKit
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
    
    
    var time = 3
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userData = realm.objects(Word.self)
        let randomValue = userData.randomElement()
        
        timerLabel.text = String(time)
        timeraction()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func timeraction() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.time -= 1
            self.timerLabel.text = String(self.time)
        })
        
        if self.time == 0 {
            self.performSegue(withIdentifier: "toDetailViewController", sender: nil)
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
