//
//  File.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/18/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import RealmSwift

class MainViewControllerViewModel:ViewModel
{
    init() {
        
        _realm = try! Realm()
        
        assignmentRecordList = _realm!.objects(AssignmentRecord.self).sorted(byKeyPath: "startTime", ascending: false)
    }
    
    init(withRealm realm:Realm) {
        
        self._realm = realm
        
        assignmentRecordList = _realm!.objects(AssignmentRecord.self).sorted(byKeyPath: "startTime", ascending: false)
    }
    
    //public properties
    private var _realm:Realm?
    public var realm:Realm?{
        get{
            return _realm
        }
        set(value){
            _realm = value
        }
    }
    
    private var _assignmentRecordList:Results<AssignmentRecord>?
    public var  assignmentRecordList:Results<AssignmentRecord>?{
        get{
            return _assignmentRecordList
        }
        set(value){
            _assignmentRecordList = value
        }
    }
    
}
