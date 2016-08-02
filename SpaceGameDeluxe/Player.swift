//
//  Player.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit




class Player: SKSpriteNode, PlayerType {
   
    static let sharedInstance = Player()
    
    var body: SKPhysicsBody!
    
    var _size = CGSize(width: 100, height: 40)
    
    var enginePower: EnginePower = EnginePower.x1
    var agilityMultiplier: AgilityMultiplier = AgilityMultiplier.x1
    var baseAgility: CGFloat = 10
    
    var armor: ArmorType?
    var shield: ShieldType?
    var health: Double = 1000
    var maxHealth: Double = 1000
    var weapon: WeaponType?
    var secondaryWeapon: WeaponType?
    var superWeapon: WeaponType?
    
    var playerTexture: SKTexture = SKTexture(imageNamed: PlayerTextures.Player.rawValue)
    
    // func move, extension
    
    func attack() {
        //unknown
    }
    func destruct() {
        //unknown
    }
    func decreaseHealth(amount: Double) {
        //unknown
    }
    
    func configureAgility(multiplier: AgilityMultiplier) {
        body.mass = baseAgility / multiplier.rawValue
    }
    
    func adjustEnginePower(power: EnginePower) {
        enginePower = power
    }
    
    func setupPhysicsBody() {
        body = SKPhysicsBody(texture: playerTexture, size: _size)
        body.affectedByGravity = false
        body.dynamic = true
        body.linearDamping = 0.1
        body.collisionBitMask = MaskValue.player
        body.categoryBitMask = MaskValue.player
        self.physicsBody = body

        configureAgility(agilityMultiplier)
    }
    
    func setupSprite() {
        texture = playerTexture
        size = _size
        name = "player"
        
        setupPhysicsBody()
    }
    
    init() {
        super.init(texture: playerTexture, color: UIColor.clearColor(), size: playerTexture.size())
        
        weapon = BasicWeapon(owner: self)
        
        setupSprite()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension Player {
    
    func move(inScene: SKScene, point: CGPoint) {
        
        let currentPositionY = self.position.y
        let indicatedY = point.y
        
        var directionOfTap: CGFloat {
            return currentPositionY - indicatedY
        }
        
        var impulseVector: CGVector {
            switch directionOfTap {
            case _ where directionOfTap > 0: return CGVectorMake(0, -100 * enginePower.rawValue)
            case _ where directionOfTap < 0: return CGVectorMake(0, 100 * enginePower.rawValue)
            case 0: return CGVectorMake(0, 0)
            default: fatalError()
            }
        }
        
        let currentImpulse = body.velocity.dy
        let adjustedImpulse = (impulseVector.dy - currentImpulse)
        let impulseToApply = CGVectorMake(0, adjustedImpulse)
        
        body.applyImpulse(impulseToApply)
        
        
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
    
    func firePrimary(inScene: SKScene) {
        if let weapon = weapon {
            weapon.fire()
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










