//
//  Enemies.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit
import GameKit


enum Enemy {
    case Basic
    case Minion
}

class BasicEnemy: SKSpriteNode, EnemyType {
    
    static var enemies = [BasicEnemy]()
    
    var spriteTexture: SKTexture = SKTexture(imageNamed: EnemyTextures.BasicEnemy.rawValue)
    var body: SKPhysicsBody!
    var health: Double = 1000
    var maxHealth: Double = 1000
    
    class func getType() -> BasicEnemy {
        return BasicEnemy()
    }
    
    //MARK: - Behaviors
    
    func move() {
        
        let destination = CGPoint(x: -self.size.width, y: position.y)
        let move = SKAction.moveTo(destination, duration: 10)
        let despawn = SKAction.removeFromParent()
        let sequence = SKAction.sequence([move, despawn])
        self.runAction(sequence, withKey: "move")

    }

    func attack(withWeapon: WeaponType) {
        //unknown
    }
    
    func destruct() {
        self.remove()
    }
   
    func decreaseHealth(amount: Double) {
        if health - amount <= 0 {
            health = 0
            destruct()
        }
        
        health -= amount
        
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
    
    
    //MARK: - Setup and Init
    
    func setupPhysicsBody() {
        body = SKPhysicsBody(texture: spriteTexture, size: spriteTexture.size())
        body.dynamic = false
        body.affectedByGravity = false
        body.usesPreciseCollisionDetection = true
        body.collisionBitMask = 0
        body.categoryBitMask = MaskValue.destructable
        body.contactTestBitMask = MaskValue.projectile
        
        physicsBody = body

    }
    
    func setupSprite() {
        self.texture = spriteTexture
        self.size = spriteTexture.size()
        self.xScale = 0.5
        self.yScale = 0.5
        
        setupPhysicsBody()
        
    }
    
    init() {
       // self.body = SKPhysicsBody(texture: spriteTexture, size: spriteTexture.size())
        super.init(texture: spriteTexture, color: UIColor.clearColor(), size: spriteTexture.size())
        setupSprite()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





