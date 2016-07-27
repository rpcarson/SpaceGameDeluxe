//
//  Enemies.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit
import GameKit

class BasicEnemy: SKSpriteNode, EnemyType {
    
    let spriteTexture = SKTexture(imageNamed: "alien1")
   
    var body: SKPhysicsBody
    var health: Int = 100
    var maxHealth: Int = 100
    
    func move(inScene: SKScene, point: CGPoint) {
        
        let descend = SKAction.moveTo(point, duration: 10)
        let despawn = SKAction.removeFromParent()
        let sequence = SKAction.sequence([descend, despawn])
        self.runAction(sequence)
        
    }
    
    func attack(withWeapon: WeaponType) {
        //unknown
    }
    func destruct() {
        //unknown
    }
    func decreaseHealth(byAmount: Double) {
        //unknown
    }
    
    static func spawn(inScene scene: SKScene) {

        let node = BasicEnemy()
        
        let randomY = RandomNumbers.randomYForObject(inScene: scene, object: node)
        let locationX = scene.size.width + node.size.width
        
        let position = CGPoint(x: locationX, y: randomY)
       
        node.position = position
        
        let destination = CGPoint(x: -node.size.width, y: position.y)
        let descend = SKAction.moveTo(destination, duration: 10)
        let despawn = SKAction.removeFromParent()
        let sequence = SKAction.sequence([descend, despawn])
        
        scene.addChild(node)
        
        node.runAction(sequence)
        
        /*
         print("ENEMY COORDINATES")
         print(" RANDOM XXXXXXX\(randomY)")
         print(" scene width \(scene.size.width)")
         print(" frame width \(scene.frame.width)")
         print(" node position \(node.position)")
         print(" view width \(scene.view?.frame.width)")
         */
        
        
    }
    
    func setupPhysicsBody() {
        self.physicsBody = body
        body.collisionBitMask = MaskValue.enemy
        body.affectedByGravity = false
        body.categoryBitMask = MaskValue.enemy
        body.dynamic = false
   
    }
    
    init() {
        self.body = SKPhysicsBody(texture: spriteTexture, size: spriteTexture.size())
        super.init(texture: spriteTexture, color: UIColor.clearColor(), size: spriteTexture.size())
        
        self.xScale = 0.5
        self.yScale = 0.5
        
        setupPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
