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
    
    func Initialize()
}

class RealmManager: IRealmManager {
    internal var realm: Realm?
    
    init() {
        realm = try! Realm()
    }
    
    public func Initialize() {
        let quotations =  realm?.objects(Quote.self)
        let assignmentRecords = realm?.objects(AssignmentRecord.self)
        
        if(quotations?.count == 0)
        {
            try! realm?.write {
                realm?.add(Quote(id:(realm?.objects(Quote.self).max(ofProperty: "id") as Int? ?? 0) + 1,content: "Realists do not fear the results of their study.", author: "Fyodor Dostoevsky"))
                realm?.add(Quote(id:(realm?.objects(Quote.self).max(ofProperty: "id") as Int? ?? 0) + 1,content: "Three can keep a secret, if two of them are dead.", author: "Benjamin Franklin"))
                realm?.add(Quote(id:(realm?.objects(Quote.self).max(ofProperty: "id") as Int? ?? 0) + 1,content: "I can't change the direction of the wind, but I can adjust my sails to always reach my destination.", author: "Jimmy Dean"))
            }
        }
        
        if(assignmentRecords?.count == 0)
        {
            
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    public func GetMaxValue(ofType type:Object.Type,ofProperty property:String)->Int!
    {
        return realm?.objects(type).max(ofProperty:property) as Int? ?? 0
    }
}
