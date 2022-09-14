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
    let userData = realm.objects(Word.self)
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var quizButton1: UIButton!
    @IBOutlet var quizButton2: UIButton!
    @IBOutlet var quizButton3: UIButton!
    @IBOutlet var quizButton4: UIButton!
    @IBOutlet var quizButton5: UIButton!
    @IBOutlet var quizButton6: UIButton!
    
    var quizNumber = Int.random(in: userData)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
