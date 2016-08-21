//
//  CollisionHandler.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/8/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


struct MaskValue {

    static let player: UInt32 = 0x1 << 1
    static let projectile: UInt32 = 0x1 << 2  /// 128
    static let enemy: UInt32 = 0x1 << 3
    static let scene: UInt32 = 0x1 << 4
    static let destructable: UInt32 = 0x1 << 5 // 32
    static let enemyProjectile: UInt32 = 0x1 << 6
    static let playerProjectile: UInt32 = 0x1 << 7
    static let boundary: UInt32 = 0x1 << 8
    
}


class ContactHandler: NSObject, SKPhysicsContactDelegate {
    
    func didBeginContact(contact: SKPhysicsContact) {
       // print("Collision Detected")
        
      //  print(contact.bodyB.node?.name)
       // print(contact.bodyA.node?.name)
        
        
        let maskA = contact.bodyA.contactTestBitMask
        let maskB = contact.bodyB.contactTestBitMask
        
        
        print("BodyA mask = \(maskA)")
        print("BodyB mask = \(maskB)")
        print("projectile mask \(MaskValue.playerProjectile)")
         print("destrictable mask \(MaskValue.destructable)")
        
        var firstBody, secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        var playerAttackingDestructable: Bool {
            return (maskA == MaskValue.playerProjectile && maskB == MaskValue.destructable) || (maskB == MaskValue.playerProjectile && maskA == MaskValue.destructable)
        }
        
        let playerProjectile = contact.bodyA.categoryBitMask == MaskValue.playerProjectile ? contact.bodyA : contact.bodyB
        
  
       
        let destructable = contact.bodyA.categoryBitMask == MaskValue.destructable ? contact.bodyA : contact.bodyB
        
//        var destructable: Destructable? {
//            if contact.bodyA.categoryBitMask == MaskValue.destructable {
//                if let body = contact.bodyA as? Destructable {
//                    return body
//                }
//            } else if
//                contact.bodyB.categoryBitMask == MaskValue.destructable {
//                if let body = contact.bodyB as? Destructable {
//                    return body
//                }
//            }
//            return nil
//        }
        
        
        if playerAttackingDestructable {
            if var enemy = destructable.node as? Destructable {
                if let damage = (playerProjectile.node as? Projectile)?.source?.weaponType.damage {
                    enemy.decreaseHealth(damage)
                    playerProjectile.node?.remove()
                    print("UGLY \(damage)")

                }
            }
            
            print("PLAYER ATTACKING DESTRUCTBLE")
            
        }
        
        if contact.bodyA.node?.name == "enemy" || contact.bodyB.node?.name == "enemy" {
            if var enemy = destructable.node as? Destructable {
                enemy.decreaseHealth(Player.sharedInstance.weapon!.weaponType.damage)
                playerProjectile.node?.remove()
            print("THING IS WORKING")
            
            }
        }
 
        if contact.bodyA.node?.name == "playerProjectile" {
        //    print("player projectile")

        }
        if contact.bodyA.node?.name == "boundary" {
         //   print("boundary")
            
        }
        
        
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        
        
    }
    
}
