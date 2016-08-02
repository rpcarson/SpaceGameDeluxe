//
//  WeaponType.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit



protocol ProjectileType {
    var origin: SKSpriteNode { get set }
}

class Projectile: SKSpriteNode {
    var projectileSpeed: CGFloat = 1
}





protocol WeaponType {
    
    var damage: Double { get set }
    var rateOfFire: Double { get set }
    // var ammoCount: Int { get set }
    var projectile: SKSpriteNode { get }
    var owner: SKSpriteNode { get set }
    
    func fire()
    
    init(owner: SKSpriteNode)
    
}

extension WeaponType {
    init(owner: SKSpriteNode) {
        self.init(owner: owner)
    }
}

class BasicBullet: SKSpriteNode, ProjectileType {
   
    let _size = CGSize(width: 5, height: 2)
    let _texture = WeaponTextures.BasicBullet.getTexture()
    
    var origin: SKSpriteNode
    
    func setupSprite() {
        physicsBody = SKPhysicsBody(texture: _texture, size: _size)
        physicsBody?.affectedByGravity = false
        physicsBody?.collisionBitMask = 0
        physicsBody?.categoryBitMask = MaskValue.enemyProjectile
        physicsBody?.contactTestBitMask = MaskValue.destructable | MaskValue.enemy
        physicsBody?.usesPreciseCollisionDetection = true
        self.position = origin.position
    }
    
    init(origin: SKSpriteNode) {
        self.origin = origin
        super.init(texture: _texture, color: UIColor.clearColor(), size: _size)
        
        setupSprite()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct BasicChainGun: WeaponType {
   
    var damage: Double = 1
    var rateOfFire: Double = 1
    var projectile: SKSpriteNode = BasicEnemy()
    
    var owner: SKSpriteNode
    
    func fire() {
    
    }
}
