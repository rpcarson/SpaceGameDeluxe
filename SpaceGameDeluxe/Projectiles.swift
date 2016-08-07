//
//  Projectiles.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class Projectile: SKSpriteNode {
    var projectileSpeed: Double = 4
}



class BasicBullet: Projectile {
    
    var _size = CGSize(width: 30, height: 20)
    var _texture = WeaponTextures.BasicBullet.getTexture()
    
    func setupSprite() {
       
        physicsBody = SKPhysicsBody(texture: _texture, size: _size)
        physicsBody?.affectedByGravity = false
        physicsBody?.collisionBitMask = 0
        //physicsBody?.categoryBitMask = MaskValue.enemyProjectile
        //physicsBody?.contactTestBitMask = MaskValue.player
        physicsBody?.usesPreciseCollisionDetection = true
        zPosition = 2
        physicsBody?.mass = 1
        physicsBody?.density = 1
      
    }
    
    func configure(projectileSpeed: Double, texture: SKTexture, size: CGSize) {
        self.projectileSpeed = projectileSpeed
        self._texture = texture
        self._size = size
    }
    
    init() {
        super.init(texture: _texture, color: UIColor.clearColor(), size: _size)
       
        setupSprite()
        
        projectileSpeed = 2
        
        physicsBody?.mass = 1
        physicsBody?.density = 1
        
   
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}