//
//  Destructable.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation


protocol Destructable {
    var maxHealth: Double { get set }
    var health: Double { get set }
    mutating func decreaseHealth(amount: Double)
    func destruct()
}

extension Destructable {
    
    mutating func decreaseHealth(amount: Double) {
        if health - amount <= 0 {
            health = 0
            destruct()
        }
        
        health -= amount
        
    }
}