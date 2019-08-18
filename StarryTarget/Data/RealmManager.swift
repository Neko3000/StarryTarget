//
//  RealmInitializer.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 2/3/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import RealmSwift

protocol IRealmManager: class{
    
    var realm:Realm? { get }
    
    func initialize()
}

class RealmManager: IRealmManager {
    internal var realm: Realm?
    
    init() {
        realm = try! Realm()
    }
    
    public func initialize() {
        let quotations =  realm?.objects(Quote.self)
        let assignmentRecords = realm?.objects(AssignmentRecord.self)
        
        if(quotations?.count == 0)
        {
            try! realm?.write {
                
                // Write your own quotes here
                realm?.add(Quote(id:(realm?.objects(Quote.self).max(ofProperty: "id") as Int? ?? 0) + 1,content: "Realists do not fear the results of their study.", author: "Fyodor Dostoevsky"))
                realm?.add(Quote(id:(realm?.objects(Quote.self).max(ofProperty: "id") as Int? ?? 0) + 1,content: "Three can keep a secret, if two of them are dead.", author: "Benjamin Franklin"))
                realm?.add(Quote(id:(realm?.objects(Quote.self).max(ofProperty: "id") as Int? ?? 0) + 1,content: "I can't change the direction of the wind, but I can adjust my sails to always reach my destination.", author: "Jimmy Dean"))
            }
        }
        
        if(assignmentRecords?.count == 0)
        {
            try! realm?.write {
                realm?.add(AssignmentRecord(id: (realm?.objects(AssignmentRecord.self).max(ofProperty: "id") as Int? ?? 0) + 1, name: "Sail", shortDescription: "To find our lost treasure", startTime: Date().addingTimeInterval(24000), timeSecond: 300, isAchieved: true))
                realm?.add(AssignmentRecord(id: (realm?.objects(AssignmentRecord.self).max(ofProperty: "id") as Int? ?? 0) + 1, name: "Reorganize", shortDescription: "Make everything well, at least looked well", startTime: Date(), timeSecond: 20, isAchieved: false))
                realm?.add(AssignmentRecord(id: (realm?.objects(AssignmentRecord.self).max(ofProperty: "id") as Int? ?? 0) + 1, name: "Unnamed", shortDescription: "", startTime: Date().addingTimeInterval(-300), timeSecond: 15, isAchieved: true))
                realm?.add(AssignmentRecord(id: (realm?.objects(AssignmentRecord.self).max(ofProperty: "id") as Int? ?? 0) + 1, name: "Singing", shortDescription: "Today's beauty is our \"Havana\"", startTime: Date().addingTimeInterval(-6000), timeSecond: 7200, isAchieved: true))
            }
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    public func getMaxValue(ofType type:Object.Type,ofProperty property:String)->Int!
    {
        return realm?.objects(type).max(ofProperty:property) as Int? ?? 0
    }
    
}
