//
//  AssignmentAchieveViewModel.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 2/15/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import RealmSwift

class AssignmentAchieveViewControllerViewModel:ViewModel{
    
    init(){
        let _realm = try! Realm()
        
        let quotes = _realm.objects(Quote.self)
        let randomIndex = Int(random: Range<Int>(0..<quotes.count))
        _quote = quotes[randomIndex]
    }
    
    init(withRealm realm:Realm){
        
        let _realm = realm
        
        let quotes = _realm.objects(Quote.self)
        let randomIndex = Int(random: Range<Int>(0..<quotes.count))
        _quote = quotes[randomIndex]
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
    
    private var _quote:Quote?
    public var quote:Quote?{
        get{
            return _quote
        }
        set(value){
            _quote = value
        }
    }
}
