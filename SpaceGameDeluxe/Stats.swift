//
//  Stats.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation



class StatKeeper {
    
    static let sharedInstance = StatKeeper()
    
    var playerMoney: Double = 0
    
    var enemiesDestroyed: Int = 0
    
    var damageDealt: Double = 0
    
    var damageTaken: Double = 0
    
}