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
    
    func enemy() -> BasicEnemy {
        switch self {
        case .basicEnemy: return BasicEnemy()
        case .minion: return Minion()
        case .trackingMinion: return TrackingMinion()
        case .basicJet: return BasicJet()
        }
    }
}


class BasicEnemy: SKSpriteNode, Destructable, Attacker {
    
    var projectileOrigin: CGPoint {
        return EnemyTextures.Minion.getProjectileOrigin(self.position)
    }
    
    var healthValue = HealthValue.basicEnemy
    let level = 1
    
    var enemyType: EnemyTextures = EnemyTextures.BasicEnemy
    
    var weapon: Weapon?
    var health: Double = 1000
    var maxHealth: Double = 1000
    
    //MARK: - Behaviors
    
    func destruct() {
        self.remove()
    }

    //MARK: - Setup and Init
    
  
    func configure(texture: SKTexture, size: CGSize, health: Double, weapon: Weapon?) {
        
        self.health = health
        self.weapon = weapon
        self.size = size
        self.texture = texture
        
        name = "enemy"
       // print("name set \(self.name)")
        
        physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody?.dynamic = true
        physicsBody?.affectedByGravity = false
        physicsBody?.usesPreciseCollisionDetection = false
        physicsBody?.collisionBitMask = 0
        physicsBody?.categoryBitMask = MaskValue.destructable
        physicsBody?.contactTestBitMask = MaskValue.playerProjectile
        
        
       
    }
    
    func defaultConfiguration() {
        health = enemyType.healthValue
        
    }
    
    init() {
        super.init(texture: EnemyTextures.BasicEnemy.getTexture(), color: UIColor.clearColor(), size: CGSize(width: 50, height: 50))
        
        
        configure(EnemyTextures.BasicEnemy.getTexture(), size: EnemyTextures.BasicEnemy.getSize(), health: EnemyTextures.BasicEnemy.healthValue, weapon: nil)
        
    }
    
    convenience init(withBehavior behavior: SKAction) {
        self.init()
        self.runAction(behavior)
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



/*  thrown out code
 
 
 class func getType() -> BasicEnemy {
 return BasicEnemy()
 }
 
 
 class func spawn(inScene scene: SKScene) {
 let scene = scene as! GameScene
 let node = getType()
 let randomY = RandomNumbers.randomYForObject(inScene: scene, object: node)
 let locationX = scene.size.width + node.size.width
 let position = CGPoint(x: locationX, y: randomY)
 node.position = position
 
 scene.addChild(node)
 enemies.append(node)
 
 scene.enemies.append(node)
 
 /*
 print("ENEMY COORDINATES")
 print(" RANDOM XXXXXXX\(randomY)")
 print(" scene width \(scene.size.width)")
 print(" frame width \(scene.frame.width)")
 print(" node position \(node.position)")
 print(" view width \(scene.view?.frame.width)")
 */
 
 }
 
 
 func move() {
 
 let destination = CGPoint(x: -self.size.width, y: position.y)
 let move = SKAction.moveTo(destination, duration: 10)
 let despawn = SKAction.removeFromParent()
 let sequence = SKAction.sequence([move, despawn])
 self.runAction(sequence, withKey: "move")
 
 }
 
 
 func setupPhysicsBody() {
 body = SKPhysicsBody(texture: spriteTexture, size: _size)
 body.dynamic = false
 body.affectedByGravity = false
 body.usesPreciseCollisionDetection = true
 body.collisionBitMask = 0
 body.categoryBitMask = MaskValue.destructable
 body.contactTestBitMask = MaskValue.playerProjectile
 physicsBody = body
 
 }
 
 func setupSprite() {
 self.texture = spriteTexture
 self.size = _size
 setupPhysicsBody()
 
 }

 var spriteTexture: SKTexture = EnemyTextures.BasicEnemy.getTexture()
 var body: SKPhysicsBody!
 var _size = CGSize(width: 50, height: 50)

 
 */





