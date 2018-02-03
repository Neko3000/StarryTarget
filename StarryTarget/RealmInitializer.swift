//
//  RealmInitializer.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 2/3/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmInitializer: class{
    
    var realm:Realm? { get }
    
    func Initialize()
}

class QuotationRealmInitializer: RealmInitializer {
    internal var realm: Realm?
    
    init() {
        realm = try! Realm()
    }
    
    public func Initialize() {
        <#code#>
    }
}
