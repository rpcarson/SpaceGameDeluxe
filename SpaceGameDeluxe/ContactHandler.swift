//
//  CollisionHandler.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/8/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


struct MaskValue {

    static let player: UInt32 = 0x1 << 1 //2
    static let projectile: UInt32 = 0x1 << 2  /// 4   /// not in use
    static let enemy: UInt32 = 0x1 << 3 // 8
    static let scene: UInt32 = 0x1 << 4 // 16
    static let destructable: UInt32 = 0x1 << 5 // 32
    static let enemyProjectile: UInt32 = 0x1 << 6 //64
    static let playerProjectile: UInt32 = 0x1 << 7 //128
    static let boundary: UInt32 = 0x1 << 8 //256
    
    static var enemyAndEnemyProjectile: UInt32 {
        return MaskValue.enemyProjectile | MaskValue.enemy
    }
    
    static var playerAndPlayerProjectile: UInt32 {
        return MaskValue.player | MaskValue.playerProjectile
    }
    
}
struct ContactMaskValue {
    static let enemyAndEnemyProjectile: UInt32 = 0x1 << 0
}


class ContactHandler: NSObject, SKPhysicsContactDelegate {
    
    func didBeginContact(contact: SKPhysicsContact) {
       // print("Collision Detected")
        
      //  print(contact.bodyB.node?.name)
       // print(contact.bodyA.node?.name)
        
        
        let maskA = contact.bodyA.contactTestBitMask
        let maskB = contact.bodyB.contactTestBitMask
        let categoryB = contact.bodyB.categoryBitMask
        let categoryA = contact.bodyA.categoryBitMask
        
        
        if debugMode
        {
            print("BodyA contact mask = \(maskA)")
            print("BodyB contact mask = \(maskB)")
        }
     
        
        /*
        if maskA == 72 {
            print("Body A = \(contact.bodyA.node)")
            print("Body B = \(contact.bodyB.node)")
        }
 */

        
        /*
        var firstBody, secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
 */
        
        var playerShotDestructable: Bool {
            return (categoryA == MaskValue.playerProjectile && categoryB == MaskValue.destructable) || (categoryB == MaskValue.playerProjectile && categoryA == MaskValue.destructable)
        }
        
   
        var enemyShotPlayer: Bool {
            return (categoryA == MaskValue.enemyProjectile && categoryB == MaskValue.player) || (categoryB == MaskValue.enemyProjectile && categoryA == MaskValue.player)
        }
        
        
        let destructable = contact.bodyA.categoryBitMask == MaskValue.destructable ? contact.bodyA : contact.bodyB
        
        var enemyProjectile: Projectile? {
            let projectile = contact.bodyA.categoryBitMask == MaskValue.enemyProjectile ? contact.bodyA : contact.bodyB
            return projectile.node as? Projectile
        }
        
        var playerProjectile: Projectile? {
            let projectile = contact.bodyA.categoryBitMask == MaskValue.playerProjectile ? contact.bodyA : contact.bodyB
            return projectile.node as? Projectile
        }
        
        var player: Player? {
            let _player = contact.bodyA.categoryBitMask == MaskValue.player ? contact.bodyA : contact.bodyB
            return _player.node as? Player
        }
        
        
        
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
        
        
        if playerShotDestructable {
            guard let projectile = playerProjectile else { return }
            if var enemy = destructable.node as? Destructable {
                    enemy.decreaseHealth(projectile.damage)
                    projectile.remove()
            }
            if debugMode { print("Player shot Destructable") }
        }
        
        if enemyShotPlayer {
            guard let player = player else { return }
            if let projectile = enemyProjectile {
                player.decreaseHealth(projectile.damage)
                projectile.remove()
            }
            
            if debugMode {  print("Enemy Shot Player") }
        }
        
        /*
        if contact.bodyA.node?.name == "enemy" || contact.bodyB.node?.name == "enemy" {
            if var enemy = destructable.node as? Destructable {
             //   enemy.decreaseHealth(Player.sharedInstance.weapon!.weaponType.damage)
                playerProjectile.node?.remove()
            print("THING IS WORKING")
            
            }
        }
 */
 
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
