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
    
    var body: SKPhysicsBody
    
    var shipAgility: CGFloat = 1
    var enginePower: CGFloat = 1
    
    var armor: ArmorType?
    var shield: ShieldType?
    var health: Double = 1000
    var maxHealth: Double = 1000
    var primaryWeapon: WeaponType = BasicWeapon()
    var secondaryWeapon: WeaponType?
    var superWeapon: WeaponType?
    
    var playerTexture: SKTexture = SKTexture(imageNamed: PlayerTextures.Player.rawValue)
    
    // func move, extension
    
    func attack(withWeapon: WeaponType) {
        //unknown
    }
    func destruct() {
        //unknown
    }
    func decreaseHealth(amount: Double) {
        //unknown
    }
    
    func setupPhysicsBody() {
        self.physicsBody = body
        body.affectedByGravity = false
        body.collisionBitMask = MaskValue.player
        body.categoryBitMask = MaskValue.player
        body.dynamic = true
    
    }
    
    init() {
        self.body = SKPhysicsBody(texture: playerTexture, size: playerTexture.size())
        super.init(texture: playerTexture, color: UIColor.clearColor(), size: playerTexture.size())
        self.xScale = 0.25
        self.yScale = 0.25
        
        setupPhysicsBody()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension Player {
    
    func move(inScene: SKScene, point: CGPoint) {
        
        shipAgility = 1
        enginePower = 1
        
        let currentPositionY = self.position.y
        let indicatedY = point.y
        
        var directionOfTap: CGFloat {
            return currentPositionY - indicatedY
        }
        
        var impulseVector: CGVector {
            switch directionOfTap {
            case _ where directionOfTap > 0: return CGVectorMake(0, -100 * enginePower)
            case _ where directionOfTap < 0: return CGVectorMake(0, 100 * enginePower)
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
    
    func fire(inScene: SKScene) {
    primaryWeapon.fire(inScene)
       
    }
  
    }
    














