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
        
        var damageToHealth: Double = 0
        
        switch self {
        case is Armored:
            if var sprite = self as? Armored {
                let damage = amount / sprite.armor.mitigationFactor
                damageToHealth = damage
                sprite.armor.degrade(amount)
                
            }
        case is Shielded:
            if var sprite = self as? Shielded {
                if !sprite.shield.isBroken {
                    sprite.shield.shieldHealth -= amount
                    sprite.shield.degrade(amount)
                } else {
                    damageToHealth = amount
                }
               
            }
            
        default: damageToHealth = amount
        }
        
        if health - damageToHealth <= 0 {
            health = 0
            destruct()
        }
        
        health -= damageToHealth
        
    }
}