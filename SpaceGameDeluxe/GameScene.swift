//
//  GameScene.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/13/16.
//  Copyright (c) 2016 Reed Carson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var fireTouchLocation: CGPoint?
    var enemies = [BasicEnemy]()
    
    var enemyTimer: Double = 0
    
    let backgroundLayer = BackgroundLayer()
    let worldLayer = WorldLayer()
    let hudLayer = HUDLayer()
    
    var moveZone: SKShapeNode!
    var fireZone: SKShapeNode!
    var nullZone: SKShapeNode!
    
    var timer: NSTimer!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let player = Player.sharedInstance
    
    var leftButton: UIButton!
    var rightButton: UIButton!
    
    func setupTouchZones() {
        let nullSize = CGSize(width: self.frame.width * 0.25, height: self.frame.height)
        let moveSize = CGSize(width: self.frame.width * 0.25, height: self.frame.height)
        let fireSize = CGSize(width: self.frame.width * 0.5, height: self.frame.height)
        let movePosition = CGPoint(x: moveSize.width/2, y: self.frame.height/2)
        let firePosition = CGPoint(x: self.frame.width - fireSize.width/2, y: self.frame.height/2)
        let nullPosition = CGPoint(x: nullSize.width/2 + nullSize.width, y: self.frame.height/2)

        moveZone = SKShapeNode(rectOfSize: moveSize)
        moveZone.fillColor = UIColor.blueColor()
        moveZone.zPosition = 10
        moveZone.alpha = 0.25
        moveZone.position = movePosition
       
        fireZone = SKShapeNode(rectOfSize: fireSize)
        fireZone.fillColor = UIColor.redColor()
        fireZone.zPosition = 10
        fireZone.alpha = 0.5
        fireZone.position = firePosition
        
        nullZone = SKShapeNode(rectOfSize: nullSize)
        nullZone.fillColor = UIColor.grayColor()
        nullZone.zPosition = 10
        nullZone.alpha = 0.3
        nullZone.position = nullPosition
        
        self.scene?.addChild(nullZone)
        self.scene?.addChild(fireZone)
        self.scene?.addChild(moveZone)
        
    }
    
    func setupButtons() {
        let leftArrow = UIImage(named: "leftArrowPNG")
        let rightArrow = UIImage(named: "rightArrowPNG")
        let arrowSize = CGSize(width: 20, height: 40)
        let position = CGPoint(x: 10, y: self.size.height - arrowSize.height - 10)
        leftButton = UIButton(frame: CGRect(x: position.x, y: position.y, width: arrowSize.width, height: arrowSize.height))
        rightButton = UIButton(frame: CGRect(x: position.x + arrowSize.width*2, y: position.y, width: arrowSize.width, height: arrowSize.height))
        leftButton.setImage(leftArrow, forState: .Normal)
        rightButton.setImage(rightArrow, forState: .Normal)
        
        
        
        self.view?.addSubview(rightButton)
        self.view?.addSubview(leftButton)
        
    }
    
    func addPlayer() {
        let position = CGPoint(x: player.size.width / 2 + 10, y: self.frame.height/2)
        player.position = position
        self.addChild(player)
    }

    
    
    func addLayers() {
        backgroundLayer.zPosition = ZPosition.Background.rawValue
        worldLayer.zPosition = ZPosition.World.rawValue
        hudLayer.zPosition = ZPosition.HUD.rawValue
        
        addChild(backgroundLayer)
        addChild(worldLayer)
        addChild(hudLayer)
    }
    
    
    override func didMoveToView(view: SKView) {
        self.view?.scene?.size = appDelegate.window!.frame.size
        
        addPlayer()
        setupTouchZones()

        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        backgroundColor = UIColor.blackColor()

    }
    
    func startFiring() {
        fire()
        timer = NSTimer.scheduledTimerWithTimeInterval(player.primaryWeapon.rateOfFire, target: self, selector: #selector(GameScene.fire), userInfo: nil, repeats: true)
    }
    func endFiring() {
        timer.invalidate()
    }
    
    func fire() {
        player.fire(self)
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
        
        print("body A \(contact.bodyA.categoryBitMask)")
        print("body B\(contact.bodyB.categoryBitMask)")
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        let categoryA = contact.bodyA.categoryBitMask
        let categoryB = contact.bodyB.categoryBitMask
        
        print("NODE A \(nodeA)")
        print("NODE B \(nodeB)")
        
        let projectileMask = player.primaryWeapon.projectile.categoryBitMask
        
        let projectileIsA = categoryA == MaskValue.projectile
        let destructableIsA = categoryA == MaskValue.destructable
        let projectileIsB = categoryB == MaskValue.projectile
        let destructableIsB = categoryB == MaskValue.destructable
        
        let projectile = categoryA == MaskValue.projectile ? nodeA : nodeB
        let destructable = categoryA == MaskValue.destructable ? nodeA : nodeB
        
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
        
        if (projectileIsA && destructableIsB) || (projectileIsB && destructableIsA) {
            
            projectile?.remove()
            
            if let enemy = destructable as? DestructableType {
                let damage = player.primaryWeapon.damage
                enemy.decreaseHealth(damage)
            }
            
            print("PROJ AND DESTRUCT CONATCT")
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {

        enemyTimer += 1
        
        if enemyTimer % 50 == 0 {
            BasicEnemy.spawn(inScene: self)
            print("100 frame spawn")
        }
        if enemyTimer % 10 == 0 {
            print("10 frame spawn")
            Minion.spawn(inScene: self)
        }
        for enemy in enemies {
            if enemy.actionForKey("move") == nil {
                enemy.move()
            }
        }
        
        
        
    }
}
