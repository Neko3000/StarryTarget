//
//  AssignmentRecord.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 2/5/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import RealmSwift

class AssignmentRecord: Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var name:String = ""
    @objc dynamic var shortDescription:String = ""
    @objc dynamic var startTime:Date = Date()
    @objc dynamic var timeSecond:Int = 0
    @objc dynamic var isAchieved:Bool = false
    
    convenience init(id:Int,name:String,shortDescription:String,startTime:Date,timeSecond:Int,isAchieved:Bool){
        self.init()
        self.id = id
        self.name = name
        self.shortDescription = shortDescription
        self.startTime = startTime
        self.timeSecond = timeSecond
        self.isAchieved = isAchieved
    }
    
    override class func primaryKey() -> String{
        return "id"
    }
}
