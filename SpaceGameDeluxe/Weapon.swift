//
//  Weapons.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

protocol Weapon {
    var firePattern: FiringPattern { get set }
    var weaponType: WeaponType { get set }
    var projectile: Projectile { get set }
    var tracking: Bool { get set }
    var owner: SKSpriteNode { get set }
    
    func dumbfire()
    func trackingFire()
    func fire()
    
    init(owner: SKSpriteNode)
    
    
}


//MARK: PlayerWeapon Protocol



protocol PlayerWeapon: Weapon {
  //  var owner: Player { get set }
 //   init(owner: Player)
}

extension PlayerWeapon {
    
    
    func addNode() -> Projectile? {
        guard let scene = owner.scene as? GameScene else { return nil }
        let node = projectile.dynamicType.init()
        node.position = (owner as! Player).projectileOrigin
        node.physicsBody?.categoryBitMask = MaskValue.playerProjectile
        node.physicsBody?.contactTestBitMask = MaskValue.destructable
        scene.projectileLayer.addChild(node)
        node.name = "playerProjectile"
        return node
    }
    
    func trackingFire() {
        let scene = owner.scene as! GameScene
        let touchLocation = scene.fireTouchLocation
        
        guard let node = addNode() else { return }
        
        
        
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
        
        let moveAction = SKAction.moveTo(destination, duration: node.projectileSpeed)
        let despawn = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, despawn])
        let nodeRotation = atan2(adjustedY, adjustedX)
        
        node.zRotation = nodeRotation
        node.runAction(sequence, withKey: "fire")
        node.runAction(sequence)
        
        
    }
    
    func dumbfire() {
        
        
    }
    
    func fire() {
        
        
    }
}



//MARK: EnemyWeapon protocol

protocol EnemyWeapon: Weapon {
   // var owner: BasicEnemy { get set }
   // init(owner: BasicEnemy)
}

extension EnemyWeapon {
   
    func addNode() -> Projectile? {
        guard let scene = owner.scene as? GameScene else { return nil }
        let node = projectile.dynamicType.init()
        node.position = (owner as! Attacker).projectileOrigin
        node.physicsBody?.categoryBitMask = MaskValue.enemyProjectile
        node.physicsBody?.contactTestBitMask = MaskValue.player
        scene.projectileLayer.addChild(node)
        node.name = "enemyProjectile"
        return node
    }
  

    
    //TODO: - Get Tracking Fire Working, use same system for dumbfire and tracking so projectie speed remains constant between the two
    
    func dumbfire() {
        
        /*
         guard let scene = owner.scene else { return }
         let node = projectile.dynamicType.init()
         node.position = owner.projectileOrigin
         scene.addChild(node)
         
         let X = Player.sharedInstance.position.x + Player.sharedInstance.size.width/2 - owner.position.x
         let Y = Player.sharedInstance.position.y - owner.position.y
         
         let magnitude: CGFloat = sqrt(X*X+Y*Y)
         
         let nodeRotation = atan2(Y, X)
         
         node.zRotation = nodeRotation
         
         node.physicsBody?.applyImpulse(CGVectorMake(X/magnitude * CGFloat(projectile.projectileSpeed), 0))
         
         print("MASS \(node.physicsBody?.mass)")
         
         */
        
        /*
         let playerPosition = CGPoint(x: Player.sharedInstance.position.x * 2, y: Player.sharedInstance.position.y * 2)
         
         
         let adjustedX = Player.sharedInstance.position.x - owner.position.x
         let adjustedY = Player.sharedInstance.position.y - owner.position.y
         
         let destination = CGPoint(x: adjustedX, y: owner.position.y + adjustedY)
         
         
         let angle = atan2(adjustedY, adjustedX)
         let speed = CGFloat(projectile.projectileSpeed)
         
         let vx = cos(angle) * speed
         let vy = sin(angle) * speed
         
         
         
         
         let vector = CGVector(dx: vx, dy: vy)
         let moveTo = SKAction.moveTo(destination, duration: 2)
         let moveToPlayer = SKAction.moveBy(vector, duration: projectile.projectileSpeed)
         
         //  node.zRotation = angle
         //  node.physicsBody?.applyImpulse(vector)
         
         */
        guard let node = addNode() else { return }
            let move = SKAction.moveByX(-UIScreen.mainScreen().bounds.width, y: 0, duration: projectile.projectileSpeed)
            
            let despawn = SKAction.removeFromParent()
        let wait = SKAction.waitForDuration(2)
            let seq = SKAction.sequence([move,despawn])
            node.runAction(seq)
        
       
        
    }
    
    func trackingFire() {
        guard let node = addNode() else { return }
        
        let X = Player.sharedInstance.position.x + Player.sharedInstance.size.width/2 - owner.position.x
        let Y = Player.sharedInstance.position.y - owner.position.y
        
        let magnitude: CGFloat = sqrt(X*X+Y*Y)
        
        let nodeRotation = atan2(Y, X)
        
        node.zRotation = nodeRotation
        
        node.physicsBody?.applyImpulse(CGVectorMake(X/magnitude * CGFloat(projectile.projectileSpeed), Y/magnitude * CGFloat(projectile.projectileSpeed)))
        
        //print("MASS \(node.physicsBody?.mass)")
        
    }
    
    func fire() {
        firePattern.pattern(self)
    }
}







