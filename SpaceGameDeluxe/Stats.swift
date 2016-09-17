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
    
    func recieveBounty(amount: Double) {
        playerMoney += amount
        
        if showStats {print("Stats - Player Money: \(playerMoney)")}
    }
    
    func trackDamageDealth(amount: Double) {
        damageDealt += amount
          if showStats && (damageDealt.truncatingRemainder(dividingBy: 100) == 0) {print("Stats - Damage Dealt: \(damageDealt)")}
    }
    
    func countEnemyDestroyed() {
        enemiesDestroyed += 1
          if showStats {print("Stats - Enemies Destroyed: \(enemiesDestroyed)")}
    }
    
}
