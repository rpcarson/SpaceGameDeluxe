//
//  Weapons.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


enum ProjectileSpeed: Double {
    case VerySlow = 5
    case Slow = 3
    case Medium = 2
    case Fast = 1
}



class BasicWeapon: WeaponType {
    
    var damage: Double = 1
    var ammoCount: Int = 100
    var rateOfFire: Double = 0.25
    var projectileSpeed: Double = ProjectileSpeed.Slow.rawValue
    var projectileSize = CGSize(width: 6, height: 3)
    
    var owner: SKSpriteNode
    
    var firingPosition: CGPoint {
        return CGPoint(x:  owner.position.x + owner.size.width/2 , y: owner.position.y)
    }
    
    var body: SKPhysicsBody {
        let physicsBody = SKPhysicsBody(rectangleOfSize: projectileSize)
        physicsBody.affectedByGravity = false
        physicsBody.collisionBitMask = 0
        physicsBody.categoryBitMask = MaskValue.projectile
        physicsBody.contactTestBitMask = MaskValue.destructable | MaskValue.enemy
        physicsBody.usesPreciseCollisionDetection = true
        return physicsBody
    }
    
    var projectile: SKSpriteNode {
        let node = SKSpriteNode(color: UIColor.redColor(), size: projectileSize)        
        node.texture = WeaponTextures.BasicBullet.getTexture()
        node.physicsBody = body
        node.position = firingPosition
        return node
    }
    
    func fire() {
        
        print("fire")
        let scene = owner.scene as! GameScene
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
        
        if let shapeNode = projectile as? SKSpriteNode {
            let moveAction = SKAction.moveTo(destination, duration: self.projectileSpeed)
            let despawn = SKAction.removeFromParent()
            let sequence = SKAction.sequence([moveAction, despawn])
            let nodeRotation = atan2(adjustedY, adjustedX)
            
            shapeNode.zRotation = nodeRotation
            
            shapeNode.runAction(sequence, withKey: "fire")
            
            scene.addChild(shapeNode)
            shapeNode.runAction(sequence)
            
        }
    }
    
    func configureWeapon(damage: Double, ammoCount: Int, rateOfFire: Double, projectileSize: CGSize, projectileSpeed: Double ) {
        self.damage = damage
        self.ammoCount = ammoCount
        self.rateOfFire = rateOfFire
        self.projectileSize = projectileSize
        self.projectileSpeed = projectileSpeed
    }
    
    required init(owner: SKSpriteNode) {
        self.owner = owner
        if owner.name == "player"  {
            body.categoryBitMask = MaskValue.playerProjectile
        }
    }

}
