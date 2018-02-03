//
//  Quotation.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 2/3/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import RealmSwift

class Quotation: Object {
    @objc dynamic var Id:Int = 0
    @objc dynamic var Content:String = ""
    @objc dynamic var Author:String = ""
    
    override class func primaryKey() -> String{
        return "Id"
    }
}
