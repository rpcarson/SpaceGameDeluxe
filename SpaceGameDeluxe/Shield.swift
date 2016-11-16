//
//  Shield.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 9/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

protocol Shielded {
    var shield: ShieldType { get set }
}



protocol ShieldType {
    var maxShield: Double { get set }
    var shieldHealth: Double { get set }
    var rechargeRate: Double { get set }
    var rechargeDelay: Double { get set }
    var isBroken: Bool { get set }
    var isCharging: Bool { get set }
    
    mutating func recharge(_ amount: Double)
    mutating func degrade(_ amount: Double)
    mutating func shatter()
    
}


// note: if player has a small amount of shield left, it can be used to tank a huge damage source. it will break but the overkill will not follow through to the player health.

extension ShieldType {
    
    mutating func recharge(_ amount: Double)
    {
        
        if isBroken { return }
        
        if shieldHealth + amount >= maxShield
        {
            shieldHealth = maxShield
            return
        }
        shieldHealth += amount
        
    }
    
    mutating func shatter() {
        isBroken = true
        shieldHealth = 0
    }
    
    mutating func degrade(_ amount: Double) {
        
        if shieldHealth - amount <= 0 {
            shieldHealth = 0
            shatter()
            return
        }
        
        shieldHealth -= amount
        
    }
    
}


struct BasicShield: ShieldType {
    var maxShield: Double = 100
    var shieldHealth: Double = 100
    var rechargeRate: Double = 1
    var rechargeDelay: Double = 2
    var isBroken: Bool = false
    var isCharging: Bool = false
}


class TextShield: SKSpriteNode, ShieldType {
    var maxShield: Double = 100
    var shieldHealth: Double = 100
    var rechargeRate: Double = 1
    var rechargeDelay: Double = 2
    var isBroken: Bool = false
    var isCharging: Bool = false
    
    init() {
        super.init(texture: ShieldTextures.testShield.getTexture(), color: UIColor.clear, size: CGSize(width: 50, height: 50))
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

















//
