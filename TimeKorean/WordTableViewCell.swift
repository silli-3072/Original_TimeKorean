//
//  WordTableViewCell.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/16.
//

import UIKit
import RealmSwift

class WordTableViewCell: UITableViewCell {
    
    let realm = try! Realm()
    
    @IBOutlet var japaneseLabel: UILabel!
    @IBOutlet var koreanLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let userData = realm.objects(Word.self)
        
    }
    
    func configureCell(japanese:String, korean:String){
        japaneseLabel.text = japanese
        koreanLabel.text = korean
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
