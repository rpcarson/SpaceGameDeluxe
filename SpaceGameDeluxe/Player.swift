//
//  Player.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


extension Player {
    var gameScene: GameScene? {
        if let scene = self.scene as? GameScene {
            return scene
        }
        return nil
    }
}

class Player: SKSpriteNode, Destructable, Attacker {
    static let sharedInstance = Player()

    var projectileOrigin: CGPoint {
        return position
    }
   
    var _size = CGSize(width: 75, height: 30)
    
    var enginePower: EnginePower = EnginePower.x1
    var agilityMultiplier: AgilityMultiplier = AgilityMultiplier.x1
    var baseAgility: CGFloat = 10
    
    var armor: ArmorType?
    var shield: ShieldType?
    var health: Double = 1000
    var maxHealth: Double = 1000
    var weapon: Weapon?
    var weapon2: Weapon?
    var secondaryWeapon: WeaponType?
    var tertiaryWeapon: WeaponType?
    
    
    var playerTexture: SKTexture = SKTexture(imageNamed: PlayerTextures.Player.rawValue)
    
    // func move, extension
    
    func attack() {
        //unknown
    }
    func destruct() {
        //unknown
    }
    func decreaseHealth(_ amount: Double) {
        //unknown
    }
    
    func configureAgility(_ multiplier: AgilityMultiplier) {
        physicsBody?.mass = baseAgility / multiplier.rawValue
    }
    
    func adjustEnginePower(_ power: EnginePower) {
        enginePower = power
    }
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(texture: playerTexture, size: _size)
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = true
        physicsBody?.linearDamping = 0.1
        physicsBody?.collisionBitMask = 0
        physicsBody?.categoryBitMask = MaskValue.player
        physicsBody?.contactTestBitMask = MaskValue.enemyProjectile | MaskValue.enemy
            
        configureAgility(agilityMultiplier)
        
    
    }
    
    func setupSprite() {
        texture = playerTexture
        size = _size
        name = "player"
        
        setupPhysicsBody()
    }
    
    init() {
        super.init(texture: playerTexture, color: UIColor.clear, size: playerTexture.size())
        

        weapon = BasePlayerGun(owner: self)
     
        
        setupSprite()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension Player {
    
    func move(_ point: CGPoint) {
        
        let currentPositionY = self.position.y
        let indicatedY = point.y
        
        var directionOfTap: CGFloat {
            return currentPositionY - indicatedY
        }
        
        var impulseVector: CGVector {
            switch directionOfTap {
            case _ where directionOfTap > 0: return CGVector(dx: 0, dy: -100 * enginePower.rawValue)
            case _ where directionOfTap < 0: return CGVector(dx: 0, dy: 100 * enginePower.rawValue)
            case 0: return CGVector(dx: 0, dy: 0)
            default: print("impulseVector failure \n");fatalError()
            }
        }
        
        // TODO: Possible crash with force unwrapped currentImpulse
        
        let currentImpulse = physicsBody?.velocity.dy
        var adjustedImpulse: CGFloat {
            if let current = currentImpulse {
                return impulseVector.dy - current
            }
            return 0
        }
        
        let impulseToApply = CGVector(dx: 0, dy: adjustedImpulse)
        
        physicsBody?.applyImpulse(impulseToApply)
        
        
        /*
         print("Impulse mechanics")
         print("CURRENT IMPULSE\(currentImpulse)")
         print("ADJUSTED IMPULSE\(adjustedImpulse)")
         print("Applied IMpulse\(impulseToApply)")
         print("locartion of tap\(directionOfTap)")
         */
        
    }
    
}

extension Player {
    
    func firePrimary() {
        if let weapon = weapon {
            weapon.trackingFire()
        }
        
    }
    
    func fireSecondary() {
        
    }
    
    func fireSuper() {
        
    }
    
}


extension Player {
    
    enum AgilityMultiplier: CGFloat {
        case x1 = 1
        case x125 = 1.25
        case x150 = 1.5
        case x175 = 1.75
        case x2 = 2
    }

}

extension Player {
    
    enum EnginePower: CGFloat {
        case x1 = 1
        case x125 = 1.25
        case x150 = 1.5
        case x175 = 1.75
        case x2 = 2
    }
    
}


extension Player {
    func recieveBounty(amount: Double) {
        StatKeeper.sharedInstance.playerMoney += amount
    }
    
}










