//
//  Weapons.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit






enum WeaponDamage {
    
}

protocol Weapon {

    var damage: Double { get set }
    var rateOfFire: Double { get set }

    var projectile: Projectile { get set }
    var tracking: Bool { get set }
    
    func dumbfire()
    func trackingFire()
    func fire(delay: Double)
    
}

extension Weapon {
    
    /*
    
    func addNode() -> Projectile? {
        var owner: SKSpriteNode = BasicEnemy()
        var _scene: GameScene? = GameScene()
        switch self {
        case is EnemyWeapon:
            owner = (self as! EnemyWeapon).owner
            _scene = (self as! EnemyWeapon).owner.gameScene
        case is PlayerWeapon:
            owner = (self as! PlayerWeapon).owner
            _scene = (self as! PlayerWeapon).owner.gameScene
        }
        guard let scene = _scene else { return nil }
        let node = projectile.dynamicType.init()
        node.position = owner.projectileOrigin
        node.physicsBody?.categoryBitMask = MaskValue.playerProjectile
        node.physicsBody?.contactTestBitMask = MaskValue.destructable
        node.name = "playerProjectile"
        print("platyer weapon node added")
        node.damage = self.damage
        scene.projectileLayer.addChild(node)
        return node
    }
    
    func trackingFire() {
        var targetLocation: CGPoint = CGPointZero
        var bulletOrigin: CGPoint = CGPointZero
        var owner: SKSpriteNode = BasicEnemy()
        
        switch self {
        case is EnemyWeapon:
             owner = (self as! EnemyWeapon).owner
             targetLocation = Player.sharedInstance.position
             bulletOrigin = owner.position
        case is PlayerWeapon:
            targetLocation = Player.sharedInstance.position
            bulletOrigin = owner.position
        default: print("tracking fire switch failure. self is \(self)")
        }
        
        //        let targetLocation = Player.sharedInstance.position
        //        let bulletOrigin = owner.position
        
        guard let node = addNode() else { return }
        
        let adjustedX = targetLocation.x - bulletOrigin.x
        let adjustedY = targetLocation.y - bulletOrigin.y
        let destination = CGPoint(x: targetLocation.x + adjustedX, y: targetLocation.y + adjustedY)
        
        // get speed increase for projectile for relative position
        let screenWidth = UIScreen.mainScreen().bounds.width
        let difference = screenWidth - bulletOrigin.x
        let perc = Double(difference / screenWidth * 100)
        let amount = (node.projectileSpeed * perc)/100
        
        
        let moveAction = SKAction.moveTo(destination, duration: node.projectileSpeed - amount)
        let despawn = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, despawn])
        let nodeRotation = atan2(adjustedY, adjustedX)
        
        node.zRotation = nodeRotation
        node.runAction(sequence, withKey: "fire")
        node.runAction(sequence)
        
    }
 */
}


//MARK: PlayerWeapon Protocol



protocol PlayerWeapon: Weapon {
    var owner: Player { get set }
}

extension PlayerWeapon {
    
    func setupNode() {
       
    }
    
    func addNode() -> Projectile? {
        guard let scene = owner.gameScene else { return nil }
        let node = projectile.dynamicType.init()
        node.position = owner.projectileOrigin
        node.physicsBody?.categoryBitMask = MaskValue.playerProjectile
        node.physicsBody?.contactTestBitMask = MaskValue.destructable
        node.name = "playerProjectile"
       // print("platyer weapon node added")
        node.damage = self.damage
        scene.projectileLayer.addChild(node)
        return node
    }
    
    func trackingFire() {
        guard let scene = owner.gameScene else { return }
        guard let node = addNode() else { return }
        guard let location = scene.fireTouchLocation else { return }
        
        let adjustedX = location.x - Player.sharedInstance.position.x
        let adjustedY = location.y - Player.sharedInstance.position.y
        
        let destination = CGPoint(x: location.x + adjustedX, y: location.y + adjustedY)

        let screenWidth = UIScreen.mainScreen().bounds.width
        let difference = screenWidth - location.x
        let perc = Double(difference / screenWidth * 100)
        let amount = (node.projectileSpeed * perc)/100
        
        let moveAction = SKAction.moveTo(destination, duration: (node.projectileSpeed - amount))
        let despawn = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, despawn])
        let nodeRotation = atan2(adjustedY, adjustedX)
        
        node.zRotation = nodeRotation
        node.runAction(sequence, withKey: "fire")
        node.runAction(sequence)
        
        
    }
    
    func dumbfire() {
        guard let node = addNode() else { return }
        let move = SKAction.moveByX(-UIScreen.mainScreen().bounds.width, y: 0, duration: node.projectileSpeed)
        let despawn = SKAction.removeFromParent()
        let seq = SKAction.sequence([move,despawn])
        node.runAction(seq)
        
    }
    
    func fire(delay: Double = 0) {
        
        
    }
}



//MARK: EnemyWeapon protocol

protocol EnemyWeapon: Weapon {
    var owner: BasicEnemy { get set }
    var firePattern: EnemyFiringPattern { get set }
    
    init(owner: BasicEnemy)

}

extension EnemyWeapon {
   
    func addNode() -> Projectile? {
        guard let scene = owner.scene as? GameScene else { print("scene not success"); return nil }
        let node = projectile.dynamicType.init()
        node.position = owner.projectileOrigin
        node.physicsBody?.categoryBitMask = MaskValue.enemyProjectile
        node.physicsBody?.contactTestBitMask = MaskValue.player
        node.name = "enemyProjectile"
        node.damage = self.damage
        scene.projectileLayer.addChild(node)
        return node
    }
    
    func dumbfire() {

        guard let node = addNode() else { return }
            let move = SKAction.moveByX(-UIScreen.mainScreen().bounds.width, y: 0, duration: node.projectileSpeed)
            let despawn = SKAction.removeFromParent()
            let seq = SKAction.sequence([move,despawn])
            node.runAction(seq)
        
       
        
    }
    
    func trackingFire() {
        let targetLocation = Player.sharedInstance.position
        let bulletOrigin = owner.position
        
        guard let node = addNode() else { return }
        
        let adjustedX = targetLocation.x - bulletOrigin.x
        let adjustedY = targetLocation.y - bulletOrigin.y
        let destination = CGPoint(x: targetLocation.x + adjustedX, y: targetLocation.y + adjustedY)
        
        // get speed increase for projectile for relative position
        let screenWidth = UIScreen.mainScreen().bounds.width
        let difference = screenWidth - bulletOrigin.x
        let perc = Double(difference / screenWidth * 100)
        let amount = (node.projectileSpeed * perc)/100

        
        let moveAction = SKAction.moveTo(destination, duration: node.projectileSpeed - amount)
        let despawn = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, despawn])
        let nodeRotation = atan2(adjustedY, adjustedX)
        
        node.zRotation = nodeRotation
        node.runAction(sequence, withKey: "fire")
        node.runAction(sequence)

        
    }
    
    func fire(delay: Double = 0) {
        firePattern.pattern(self, delay: delay)
    }
 
 
}
 







