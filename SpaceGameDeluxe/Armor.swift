//
//  Armor.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 9/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation


protocol Armored {
    var armor: ArmorType { get set }
}


protocol ArmorType {
    var maxArmor: Double { get set }
    var armorHealth: Double { get set }
    var mitigationFactor: Double { get set }
    var isBroken: Bool { get set }
    
    mutating func degrade(amount: Double)
    mutating func breakDown()
}

extension ArmorType {
    mutating func degrade(amount: Double) {
        
        if isBroken { return }
        
        if armorHealth - amount <= amount {
            armorHealth = 0
            breakDown()
            return
        }
        armorHealth -= amount
    }
    mutating func breakDown() {
        isBroken = true
        armorHealth = 0
        mitigationFactor = 1
    }
}


struct BasicArmor: ArmorType {
    var maxArmor: Double = 100
    var armorHealth: Double = 100
    var mitigationFactor: Double = 1.05
    var isBroken: Bool = false
}






//

