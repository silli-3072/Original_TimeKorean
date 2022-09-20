//
//  AddWordViewController.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/13.
//

import UIKit
import RealmSwift

class AddWordViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet var japaneseTextfield: UITextField!
    @IBOutlet var koreanTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    @IBAction func saveButton() {
        if japaneseTextfield.text!.isEmpty {
            let alert: UIAlertController = UIAlertController(title: "保存できません", message: "日本語を登録してください", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "戻る", style: .default, handler: { action in
                print("🎱")
            }))
            
            present(alert, animated: true, completion: nil)
        } else if koreanTextfield.text!.isEmpty {
            let alert: UIAlertController = UIAlertController(title: "保存できません", message: "韓国語を登録してください", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "戻る", style: .default, handler: { action in
                print("🛝")
            }))
            
            present(alert, animated: true, completion: nil)
        } else {
            let word = Word()
            word.japanese = japaneseTextfield.text!
            word.korean = koreanTextfield.text!
            
            try! realm.write {
                realm.add(word)
            }
            
            print("🛼")
            
            navigationController?.popViewController(animated: true)
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
