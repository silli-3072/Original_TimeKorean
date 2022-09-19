//
//  ResultViewController.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/13.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var homeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restartButton.layer.cornerRadius = 30
        self.homeButton.layer.cornerRadius = 30

        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartButtonTapped() {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func homeButtonTapped() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
        
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
