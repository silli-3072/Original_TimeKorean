//
//  WordTableViewCell.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/16.
//

import UIKit

class WordTableViewCell: UITableViewCell {
    
    @IBOutlet var japaneseLabel: UILabel!
    @IBOutlet var koreanLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
