//
//  HomeViewController.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/13.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var gameButton: UIButton!
    @IBOutlet var wordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameButton.layer.cornerRadius = 30
        self.wordButton.layer.cornerRadius = 30

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
