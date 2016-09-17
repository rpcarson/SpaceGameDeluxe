//
//  Enemies.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit
import GameKit


//enum HeathValue: Double {
//    case BasicEnemy = 100
//    case Minion = 10
//    case Mine = 20
//}




struct HealthValue {
    static let basicEnemy = 100.0
    static let minion = 10.0
    static let mine = 20.0
}

enum EnemyType {
    case basicEnemy
    case minion
    case trackingMinion
    case basicJet
    case mine
    
    func enemy() -> BasicEnemy {
        switch self {
        case .basicEnemy: return BasicEnemy()
        case .minion: return Minion()
        case .trackingMinion: return TrackingMinion()
        case .basicJet: return BasicJet()
        case .mine: return Mine()
        }
    }
}


class BasicEnemy: SKSpriteNode, Destructable, Attacker {
    
    var projectileOrigin: CGPoint {
        return EnemyTextures.minion.getProjectileOrigin(self.position)
    }
    
    var healthValue = HealthValue.basicEnemy
    let level = 1
    
    var enemyType: EnemyTextures = EnemyTextures.basicEnemy
    
    var weapon: Weapon?
    var health: Double = 1000
    var maxHealth: Double = 1000
    
    var armor: Double = 0
    
    var effectiveHealth: Double {
        if let _self =  self as? Armored {
            return _self.armor.mitigationFactor * health
        }
        return health + armor
    }
    
    //MARK: - Behaviors

        func destruct() {
            StatKeeper.sharedInstance.recieveBounty(amount: self.enemyType.bounty)
            StatKeeper.sharedInstance.countEnemyDestroyed()
            self.remove()
        }

  

    //MARK: - Setup and Init
    
  
    func configure(_ texture: SKTexture, size: CGSize, health: Double, weapon: Weapon?) {
        
        self.health = health
        self.weapon = weapon
        self.size = size
        self.texture = texture
        
        name = "enemy"
        
        physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody?.isDynamic = true
        physicsBody?.affectedByGravity = false
        physicsBody?.usesPreciseCollisionDetection = false
        physicsBody?.collisionBitMask = 0
        physicsBody?.categoryBitMask = MaskValue.destructable
        physicsBody?.contactTestBitMask = MaskValue.playerProjectile
        
        physicsBody?.mass = 1
        physicsBody?.linearDamping = 0.5
        
        
       
    }
    
    func defaultConfiguration() {
        health = enemyType.healthValue
        
    }
    
    init() {
        super.init(texture: EnemyTextures.basicEnemy.getTexture(), color: UIColor.clear, size: CGSize(width: 50, height: 50))
        
        
        configure(EnemyTextures.basicEnemy.getTexture(), size: EnemyTextures.basicEnemy.getSize(), health: EnemyTextures.basicEnemy.healthValue, weapon: nil)
        
    }
    
    convenience init(withBehavior behavior: SKAction) {
        self.init()
        self.run(behavior)
    }
    
    convenience init(texture: SKTexture, size: CGSize, health: Double, weapon: Weapon?) {
        self.init()
        self.texture = texture
        self.health = health
        self.weapon = weapon
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BasicEnemy {
    var gameScene: GameScene? {
        if let scene = self.scene as? GameScene {
            return scene
        }
        return nil
    }
}

extension BasicEnemy {
    var bounty: Double {
        return self.enemyType.bounty
    }
    

}


