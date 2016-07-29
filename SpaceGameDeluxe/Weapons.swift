//
//  Weapons.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class BasicWeapon: WeaponType {
    
    var damage: Double = 1
    var ammoCount: Int = 100
    var rateOfFire: Double = 0.25
    
    let projectileSpeed: Double = 0.75
    
    let projectileSize = CGSize(width: 6, height: 3)
    
    var owner: SKSpriteNode?
    
    var firingPosition: CGPoint {
        return CGPoint(x: Player.sharedInstance.position.x + Player.sharedInstance.size.width/2, y: Player.sharedInstance.position.y)
    }
    
    var body: SKPhysicsBody {
        let physicsBody = SKPhysicsBody(rectangleOfSize: projectileSize)
        physicsBody.affectedByGravity = false
        physicsBody.collisionBitMask = 0
        physicsBody.categoryBitMask = MaskValue.projectile
        physicsBody.contactTestBitMask = MaskValue.enemy | MaskValue.destructable
        physicsBody.usesPreciseCollisionDetection = true
        return physicsBody
    }
    
    var projectile: AnyObject {
        let node = SKShapeNode(rectOfSize: projectileSize)
        node.fillColor = UIColor.redColor()
        node.physicsBody = body
        node.position = firingPosition
        return node
    }
    
    func fire(inScene: SKScene) {
        let scene = inScene as! GameScene
        let touchLocation = scene.fireTouchLocation
        
        guard let location = touchLocation else { return }
        
        let adjustedX = location.x - Player.sharedInstance.position.x
        let adjustedY = location.y - Player.sharedInstance.position.y
        
        let destination = CGPoint(x: location.x + adjustedX, y: location.y + adjustedY)
        
        /*
        print("Firing Coordinates")
        print("DESTINATION \(destination)")
        print("TOUCH Y \(location.y)")
        print("TOUCH X \(location.x)")
        print("PLAYER LOC \(Player.sharedInstance.position)")
        */
        
        if let shapeNode = projectile as? SKShapeNode {
            let moveAction = SKAction.moveTo(destination, duration: self.projectileSpeed*2)
            let despawn = SKAction.removeFromParent()
            let sequence = SKAction.sequence([moveAction, despawn])
            let nodeRotation = atan2(adjustedY, adjustedX)
            
            shapeNode.zRotation = nodeRotation
            
            shapeNode.runAction(sequence, withKey: "fire")
            
            inScene.addChild(shapeNode)
            shapeNode.runAction(sequence)
            
        }
    }
    
}
