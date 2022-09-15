//
//  TableViewCell.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/15.
//

import Foundation
import UIKit
 
class TableViewCell: UITableViewCell {
    @IBOutlet weak var japaneseLabel: UILabel!
    @IBOutlet weak var koreanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
