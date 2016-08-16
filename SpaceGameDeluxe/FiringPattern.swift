//
//  FiringPattern.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/6/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


protocol FiringPattern {
    func pattern(weapon: Weapon)
}

protocol EnemyFiringPattern: FiringPattern { }


struct BurstThree: EnemyFiringPattern {
    
    func pattern(weapon: Weapon) {
        let fire = SKAction.runBlock {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        for i in 0..<3 {
            let wait = SKAction.waitForDuration(Double(i))
            let sequence = SKAction.sequence([wait, fire])
            
            (weapon.owner.scene as! GameScene).worldLayer.runAction(sequence)
                        
        }
        
    }
    
}


    














//