//
//  FiringPattern.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/6/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


//TODO:// Burst mechanics get weird for burstspeeds less than 1


protocol FiringPattern {
    func pattern(_ weapon: Weapon, delay: Double)
}

protocol EnemyFiringPattern {
 func pattern(_ weapon: EnemyWeapon, delay: Double)

}

enum BurstSpeed: Double {
    case fast = 0.25
    case medium = 1
    case slow = 3
    case x05 = 0.5
    case x15 = 1.5
    case x075 = 0.75
}


struct BurstThree: EnemyFiringPattern {
    
    func pattern(_ weapon: EnemyWeapon, delay: Double = 0) {
        let fireDelay = SKAction.wait(forDuration: delay)
        let fire = SKAction.run {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        
        let burstBlock = {
            for i in 0..<3 {
                let wait = SKAction.wait(forDuration: Double(i))
                let sequence = SKAction.sequence([wait, fire])
                if let scene = weapon.owner.scene as? GameScene {
                        scene.worldLayer.run(sequence)
                }
            }
        }
        let block = SKAction.run(burstBlock)
        let sequenceWithDelay = SKAction.sequence([fireDelay, block])
        
        (weapon.owner.scene as! GameScene).worldLayer.run(sequenceWithDelay)
    }
    
}

struct QuickBurst: EnemyFiringPattern {
    
    func pattern(_ weapon: EnemyWeapon, delay: Double = 0) {
        let fireDelay = SKAction.wait(forDuration: delay)
        let fire = SKAction.run {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        
        let burstBlock = {
            for i in 1...3 {
                let wait = SKAction.wait(forDuration: Double(Double(i)/5))
                let sequence = SKAction.sequence([wait, fire])
                if let scene = weapon.owner.scene as? GameScene {
                    scene.worldLayer.run(sequence)
                }
            }
        }
        let block = SKAction.run(burstBlock)
        let sequenceWithDelay = SKAction.sequence([fireDelay, block])
        
        if let scene = weapon.owner.scene as? GameScene {
            if let fireZone = scene.fireZone {
                let position = weapon.owner.position
                if fireZone.contains(position) {
                    scene.worldLayer.run(sequenceWithDelay)
                }
                
            }
        }
    }
    
}


struct Burst: EnemyFiringPattern {
    var shotsInBurst: Int
    var burstSpeed: Double
    var timeBetweenBursts: Double
    
    func pattern(_ weapon: EnemyWeapon, delay: Double = 0) {
        
        
        guard let scene = weapon.owner.scene as? GameScene  else { return }

        
        let fireDelay = SKAction.wait(forDuration: delay)
        let fire = SKAction.run {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        
        let burstBlock = {
            for i in 1...self.shotsInBurst {
                let wait = SKAction.wait(forDuration: Double(Double(i)*self.burstSpeed))
                let sequence = SKAction.sequence([wait, fire])
           
                    if let fireZone = scene.fireZone {
                        let position = weapon.owner.position
                        if fireZone.contains(position) {
                            scene.worldLayer.run(sequence)
                        }
                        
                    }

               
            }
        }
        let block = SKAction.run(burstBlock)
        let tie = timeBetweenBursts + (burstSpeed * Double(shotsInBurst))
        let timeBetween = SKAction.wait(forDuration: tie)
        let fireSequence = SKAction.sequence([block, timeBetween])
        let repeater = SKAction.repeatForever(fireSequence)
        let sequenceWithDelay = SKAction.sequence([fireDelay, repeater])
        
        if let scene = weapon.owner.scene as? GameScene {
          //  print("scene =")
            if let fireZone = scene.fireZone {
          //  print("firezzone main block")
                let position = weapon.owner.position
               // print(position)
                if fireZone.contains(position) {                  
                    weapon.owner.run(sequenceWithDelay)
                 
                }
                
            }
        }
          //  scene.worldLayer.runAction(sequenceWithDelay)
        
    }
    
    init(shotsInBurst: Int, burstSpeed: Double, timeBetween: Double) {
        self.shotsInBurst = shotsInBurst
        self.burstSpeed = burstSpeed
        self.timeBetweenBursts = timeBetween
    }
}


struct SteadyFire: EnemyFiringPattern {
    
    var frequency: Double
    
    func pattern(_ weapon: EnemyWeapon, delay: Double = 0) {
        let fireDelay = SKAction.wait(forDuration: delay)
        let fire = SKAction.run {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        
        let timeBetweenShots = SKAction.wait(forDuration: frequency)
        
        let sequence = SKAction.sequence([timeBetweenShots,fire])
        
        let repeater = SKAction.repeatForever(sequence)
        
        let fullSequence = SKAction.sequence([fireDelay,repeater])
        
        if let scene = weapon.owner.scene as? GameScene {
            if let fireZone = scene.fireZone {
                let position = weapon.owner.position
                if fireZone.contains(position) {
                   weapon.owner.run(fullSequence)
                    
                    //scene.worldLayer.runAction(fullSequence)
                }
                
            }
        }
  
    }
    
    init(frequency: Double) {
        self.frequency = frequency
    }
    
}


    














//
