//
//  Quotation.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 2/3/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import RealmSwift

class Quote: Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var content:String = ""
    @objc dynamic var author:String = ""

    convenience init(id:Int,content:String,author:String) {
        self.init()
        self.id = id
        self.content = content
        self.author = author
    }
    
    override static func primaryKey() -> String{
        return "id"
    }
}
