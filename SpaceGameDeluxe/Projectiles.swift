//
//  Projectiles.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


enum ProjectileSpeed: Double {
    case VerySlow = 12
    case Slow = 8
    case Medium = 4
    case Fast = 3
    case VeryFast = 2
}


//projectile masks are set in addNode in Weapon protocol

class Projectile: SKSpriteNode {
    var projectileSpeed: Double = 10
    var damage: Double = 0
    
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

}



class BasicBullet: Projectile {
     init() {
         super.init(texture: WeaponTextures.BasicBullet.getTexture(), color: UIColor.clearColor(), size: CGSize(width: 50, height: 50))
        configure(WeaponTextures.BasicBullet.getTexture(), size: CGSize(width: 20, height: 5), speed: ProjectileSpeed.VeryFast.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BasicRoundBullet: BasicBullet {
    override init() {
        super.init()
       configure(WeaponTextures.EnergyBulletPurple.getTexture(), size: CGSize(width: 20, height: 20), speed: ProjectileSpeed.Slow.rawValue)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BasicMissile: BasicBullet {
      override init() {
        super.init()
        configure(WeaponTextures.PlaceHolderMissile.getTexture(), size: CGSize(width: 50, height: 10), speed: 7)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}






















//