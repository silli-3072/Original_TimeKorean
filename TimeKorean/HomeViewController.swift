//
//  HomeViewController.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/13.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet var gameButton: UIButton!
    @IBOutlet var wordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameButton.layer.cornerRadius = 30
        self.wordButton.layer.cornerRadius = 30
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapGameButton() {
        let userData = realm.objects(Word.self)
        
        if userData.count == 0 {
            print("🇺🇸")
            let alert: UIAlertController = UIAlertController(title: "単語の登録がありません", message: "単語を登録してください", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "単語登録", style: .default, handler: { action in
                self.performSegue(withIdentifier: "WordView", sender: nil)
            }))
            
            present(alert, animated: true, completion: nil)
        } else if userData.count < 10 {
            let alert: UIAlertController = UIAlertController(title: "単語の登録が少ないです", message: "単語登録が多い方が高い学習成果を得られます", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ゲームを続ける", style: .default, handler: { action in
                self.performSegue(withIdentifier: "toGame", sender: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "単語登録", style: .default, handler: { action in
                self.performSegue(withIdentifier: "WordView", sender: nil)
            }))
            
            present(alert, animated: true, completion: nil)
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
