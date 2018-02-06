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
    @objc var id:Int = 0
    @objc var title:String = ""
    @objc var shortDescription:String = ""
    @objc var startTime:Date = Date()
    @objc var timeSecond:Int = 0
    @objc var isAchieved:Bool = false
    
    convenience init(title:String,shortDescription:String,startTime:Date,timeSecond:Int,isAchieved:Bool){
        self.init()
        self.title = title
        self.shortDescription = shortDescription
        self.startTime = startTime
        self.timeSecond = timeSecond
        self.isAchieved = isAchieved
    }
    
    override class func primaryKey() -> String{
        return "id"
    }
}
