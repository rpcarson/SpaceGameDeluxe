//
//  FiringPattern.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/6/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


protocol FiringPattern {
    func pattern(weapon: Weapon, delay: Double)
}

protocol EnemyFiringPattern {
 func pattern(weapon: EnemyWeapon, delay: Double)

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
    
    func pattern(weapon: EnemyWeapon, delay: Double = 0) {
        let fireDelay = SKAction.waitForDuration(delay)
        let fire = SKAction.runBlock {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        
        let burstBlock = {
            for i in 0..<3 {
                let wait = SKAction.waitForDuration(Double(i))
                let sequence = SKAction.sequence([wait, fire])
                if let scene = weapon.owner.scene as? GameScene {
                        scene.worldLayer.runAction(sequence)
                }
            }
        }
        let block = SKAction.runBlock(burstBlock)
        let sequenceWithDelay = SKAction.sequence([fireDelay, block])
        
        (weapon.owner.scene as! GameScene).worldLayer.runAction(sequenceWithDelay)
    }
    
}

struct QuickBurst: EnemyFiringPattern {
    
    func pattern(weapon: EnemyWeapon, delay: Double = 0) {
        let fireDelay = SKAction.waitForDuration(delay)
        let fire = SKAction.runBlock {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        
        let burstBlock = {
            for i in 1...3 {
                let wait = SKAction.waitForDuration(Double(Double(i)/5))
                let sequence = SKAction.sequence([wait, fire])
                if let scene = weapon.owner.scene as? GameScene {
                    scene.worldLayer.runAction(sequence)
                }
            }
        }
        let block = SKAction.runBlock(burstBlock)
        let sequenceWithDelay = SKAction.sequence([fireDelay, block])
        
        if let scene = weapon.owner.scene as? GameScene {
            if let fireZone = scene.fireZone {
                let position = weapon.owner.position
                if fireZone.containsPoint(position) {
                    scene.worldLayer.runAction(sequenceWithDelay)
                }
                
            }
        }
    }
    
}


struct Burst: EnemyFiringPattern {
    var shotsInBurst: Int
    var burstSpeed: Double
    var timeBetweenBursts: Double
    
    func pattern(weapon: EnemyWeapon, delay: Double = 0) {
        
        
        guard let scene = weapon.owner.scene as? GameScene  else { return }

        
        let fireDelay = SKAction.waitForDuration(delay)
        let fire = SKAction.runBlock {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        
        let burstBlock = {
            for i in 1...self.shotsInBurst {
                let wait = SKAction.waitForDuration(Double(Double(i)*self.burstSpeed))
                let sequence = SKAction.sequence([wait, fire])
              // print("wait = \(((Double(i)*self.burstSpeed)))")
                //print("i = \(i)")
                //print(self.burstSpeed)
               
                
           //     if let scene = weapon.owner.scene as? GameScene {
                    
                  //  print("burst block scene")
                    if let fireZone = scene.fireZone {
                        
                       // print("firezzone busrtblock")
                        
                        let position = weapon.owner.position
                        if fireZone.containsPoint(position) {
                            scene.worldLayer.runAction(sequence)
                          // print("busrtBlock")
                        }
                        
                    }
               // }
 
                weapon.owner.runAction(sequence)
               // scene.worldLayer.runAction(sequence)
              //  print("burst")
               
            }
        }
        let block = SKAction.runBlock(burstBlock)
        let tie = timeBetweenBursts + (burstSpeed * Double(shotsInBurst))
        let timeBetween = SKAction.waitForDuration(tie)
        let fireSequence = SKAction.sequence([block, timeBetween])
        let repeater = SKAction.repeatActionForever(fireSequence)
        let sequenceWithDelay = SKAction.sequence([fireDelay, repeater])
        
        if let scene = weapon.owner.scene as? GameScene {
          //  print("scene =")
            if let fireZone = scene.fireZone {
          //  print("firezzone main block")
                let position = weapon.owner.position
               // print(position)
                if fireZone.containsPoint(position) {
                  
                    weapon.owner.runAction(sequenceWithDelay)
                    // scene.worldLayer.runAction(sequenceWithDelay)
                   // print("firing")
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
    
    func pattern(weapon: EnemyWeapon, delay: Double = 0) {
        let fireDelay = SKAction.waitForDuration(delay)
        let fire = SKAction.runBlock {
            if weapon.tracking {
                weapon.trackingFire()
            } else {
                weapon.dumbfire()
            }
        }
        
        let timeBetweenShots = SKAction.waitForDuration(frequency)
        
        let sequence = SKAction.sequence([timeBetweenShots,fire])
        
        let repeater = SKAction.repeatActionForever(sequence)
        
        let fullSequence = SKAction.sequence([fireDelay,repeater])
        
        if let scene = weapon.owner.scene as? GameScene {
            if let fireZone = scene.fireZone {
                let position = weapon.owner.position
                if fireZone.containsPoint(position) {
                   weapon.owner.runAction(fullSequence)
                    
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