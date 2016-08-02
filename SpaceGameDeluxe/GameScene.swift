//
//  GameScene.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/13/16.
//  Copyright (c) 2016 Reed Carson. All rights reserved.
//

import SpriteKit

protocol ActionScene {
    var frameCount: Double { get set }
    var pattern: ScenePattern? { get }
}

class GameScene: SKScene, SKPhysicsContactDelegate, ActionScene {
    
    var fireTouchLocation: CGPoint?
    var enemies = [BasicEnemy]()
    
    var frameCount: Double = 0
    var pattern: ScenePattern?
    
    var moveZone: SKShapeNode!
    var fireZone: SKShapeNode!
    var nullZone: SKShapeNode!
    
    var timer: NSTimer!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let player = Player.sharedInstance
    
    override func didMoveToView(view: SKView) {
        addPlayer()
        setupTouchZones()
        setupPhysics()
        
        pattern = PatternOne(scene: self)
        pattern?.delegate = self
        
        backgroundColor = UIColor.blackColor()
        
    }
    
    func setupPhysics() {
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }
    
    func addPlayer() {
        let position = CGPoint(x: player.size.width / 2 + 10, y: self.frame.height/2)
        player.position = position
        self.addChild(player)
    }
    
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            if nullZone.containsPoint(location) {
                endFiring()
            }
            if fireZone.containsPoint(location) {
                fireTouchLocation = location
            }
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for enemy in enemies {
            if enemy as BasicEnemy is Minion {
                // enemy.attack(self)
            }
        }
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if fireZone.containsPoint(location) {
                fireTouchLocation = location
                startFiring()
            }
            if moveZone.containsPoint(location) {
                player.move(self, point: location)
            }
            if nullZone.containsPoint(location) {
                endFiring()
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            if fireZone.containsPoint(location) || nullZone.containsPoint(location) {
                endFiring()
            }
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        //  print("physics contact")
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        let categoryA = contact.bodyA.categoryBitMask
        let categoryB = contact.bodyB.categoryBitMask
        
        let projectileIsA = categoryA == MaskValue.projectile
        let destructableIsA = categoryA == MaskValue.destructable
        let projectileIsB = categoryB == MaskValue.projectile
        let destructableIsB = categoryB == MaskValue.destructable
        
        let projectile = categoryA == MaskValue.projectile ? nodeA : nodeB
        let destructable = categoryA == MaskValue.destructable ? nodeA : nodeB
        /*
         if projectileIsA  {
         print("projectile is A")
         }
         if projectileIsB {
         print("projectile is B")
         }
         
         if destructableIsB {
         print("destruvtable is B")
         }
         
         if destructableIsA {
         print("destruvtable is A")
         }
         
         print("body A \(contact.bodyA.categoryBitMask)")
         print("body B\(contact.bodyB.categoryBitMask)")
         
         print("NODE A \(nodeA)")
         print("NODE B \(nodeB)")
         */
        if (projectileIsA && destructableIsB) || (projectileIsB && destructableIsA) {
            
            projectile?.remove()
            
            if var enemy = destructable as? Destructable {
                let damage = player.weapon!.damage
                enemy.decreaseHealth(damage)
            }
            
            //  print("PROJ AND DESTRUCT CONATCT")
            
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        frameCount += 1
        
        pattern?.updateScene()
        
        /*
        
        if frameCount % 100 == 0 {
            BasicEnemy.spawn(inScene: self)
            // print("100 frame spawn")
        }
        if frameCount % 70 == 0 {
            // print("70 frame spawn")
            Minion.spawn(inScene: self)
        }
        for enemy in enemies {
            if enemy.actionForKey("move") == nil {
                enemy.move()
                
            }
            if enemy as BasicEnemy is Minion {
                // enemy.attack(self)
                print("minion attack")
            }
            
            
            
        }
 */
        
        
        
    }
    
}



