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
    var source: Weapon?
    

}



class BasicBullet: Projectile {
    
    func configure(texture: SKTexture, size: CGSize, speed: Double) {
       
        self.texture = texture
        
        self.size = size
        self.projectileSpeed = speed

        name = "projectile"
        physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody?.dynamic = true
        physicsBody?.affectedByGravity = false
        physicsBody?.usesPreciseCollisionDetection = true
        physicsBody?.collisionBitMask = 0
        physicsBody?.mass = 1
        physicsBody?.density = 1
    
    }
    
    init() {
        super.init(texture: WeaponTextures.BasicBullet.getTexture(), color: UIColor.clearColor(), size: CGSize(width: 50, height: 50))
    }
    
    init(source: Weapon) {
        super.init(texture: WeaponTextures.BasicBullet.getTexture(), color: UIColor.clearColor(), size: CGSize(width: 50, height: 50))
        
        configure(WeaponTextures.BasicBullet.getTexture(), size: CGSize(width: 20, height: 5), speed: 2)
        
        self.source = source
               // print("REGULAR MASS\(physicsBody?.mass)")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BasicRoundBullet: BasicBullet {
    
    override init(source: Weapon) {
        super.init(source: source)
        
        configure(WeaponTextures.EnergyBulletPurple.getTexture(), size: CGSize(width: 20, height: 20), speed: 4)
        
         self.source = source
        
       // print("ROUND MASS\(physicsBody?.mass)")

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BasicMissile: BasicBullet {
    
    override  init(source: Weapon) {
        super.init(source: source)
        
        configure(WeaponTextures.PlaceHolderMissile.getTexture(), size: CGSize(width: 50, height: 10), speed: 7)
        
      self.source = source
        
        // print("ROUND MASS\(physicsBody?.mass)")
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}






















//