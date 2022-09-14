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
    
    @IBAction func saveButton() {
        let word = Word()
        word.japanese = japaneseTextfield.text!
        word.korean = koreanTextfield.text!
        
        try! realm.write {
            realm.add(word)
        }
        
        navigationController?.popViewController(animated: true)
        //self.navigationController?.popToRootViewController(animated: true)
        
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
