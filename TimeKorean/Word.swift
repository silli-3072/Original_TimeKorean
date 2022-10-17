//
//  Word.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/13.
//

import Foundation
import RealmSwift

class Word: Object {
    @objc dynamic var japanese: String = ""
    @objc dynamic var korean: String = ""
    
}
