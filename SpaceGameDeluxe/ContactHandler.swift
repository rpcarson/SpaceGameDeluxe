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
    static let projectile: UInt32 = 0x1 << 2
    static let enemy: UInt32 = 0x1 << 3
    static let scene: UInt32 = 0x1 << 4
    static let destructable: UInt32 = 0x1 << 5
    static let enemyProjectile: UInt32 = 0x1 << 6
    static let playerProjectile: UInt32 = 0x1 << 7
    static let boundary: UInt32 = 0x1 << 8
    
}


class ContactHandler: NSObject, SKPhysicsContactDelegate {
    
    func didBeginContact(contact: SKPhysicsContact) {
       // print("Collision Detected")
        
      //  print(contact.bodyB.node?.name)
       // print(contact.bodyA.node?.name)
        let playerProjectile = contact.bodyA.categoryBitMask == MaskValue.playerProjectile ? contact.bodyA : contact.bodyB
        let enemy = contact.bodyA.categoryBitMask == MaskValue.destructable ? contact.bodyA : contact.bodyB
        
        if contact.bodyA.node?.name == "enemy" || contact.bodyB.node?.name == "enemy" {
            if var enemy = enemy.node as? Destructable {
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
