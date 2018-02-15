//
//  RandomInt.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 2/6/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation

extension Int {
    init(random range: Range<Int>) {
        
        let offset: Int
        if range.lowerBound < 0 {
            offset = abs(range.lowerBound)
        } else {
            offset = 0
        }
        
        let min = UInt32(range.lowerBound + offset)
        let max = UInt32(range.upperBound + offset)
        
        self = Int(min + arc4random_uniform(max - min)) - offset
    }
}
