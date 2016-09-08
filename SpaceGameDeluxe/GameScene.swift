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
    var pattern: ScenePattern? { get set }
    var spawner: Spawner? { get set }
    var worldLayer: WorldLayer { get  }
    var hudLayer: HUDLayer { get  }
    var backgroundLayer: BackgroundLayer { get  }
    var actorLayer: ActorLayer { get  }
    var projectileLayer: ProjectileLayer { get  }
    var zoneLayer: ZoneLayer { get  }
    
   
    
}



class GameScene: SKScene, ActionScene {
    
    var scrollingBackground: Scroller?
    var scroller2: Scroller?
    
    var spawner: Spawner?
    
    let contactHandler = ContactHandler()
    
    let boundary = PhysicsBoundary()
    
    let worldLayer = WorldLayer()
    let hudLayer = HUDLayer()
    let backgroundLayer = BackgroundLayer()
    let actorLayer = ActorLayer()
    let projectileLayer = ProjectileLayer()
    let zoneLayer = ZoneLayer()
    
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
    
    let bg1 = SKSpriteNode(imageNamed: "starOverlay")
    let bg2 = SKSpriteNode(imageNamed: "starOverlay")
    let bgMain = SKSpriteNode(imageNamed: "redStarBG1")
    let bgMain1 = SKSpriteNode(imageNamed: "redStarBG1")
    
    override func didMoveToView(view: SKView) {
        size.width = UIScreen.mainScreen().bounds.width
         size.height = UIScreen.mainScreen().bounds.height
        
        spawner = Spawner(actionScene: self)
        
        setupScene()
        
        worldLayer.speed = simulationSpeed        
    
        boundary.getDimensions()
        
     
        let array = [bg1, bg2]
        let array2 = [bgMain, bgMain1]
        scrollingBackground = Scroller(scene: self, speed: 12, type: .debris)
        scroller2 = Scroller(scene: self, speed: 0.5, type: .background)
        
        scroller2?.images = array2
        
        scroller2?.setup()
        
        scrollingBackground?.images = array
        
        scrollingBackground?.setup()
    }
    
 
    
    func setupScene() {
        setupLayers()
        setupTouchZones()
        setupPhysics()
        loadPattern()
        setupBoundary()
        addPlayer()
        
        backgroundColor = UIColor.blackColor()
        
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
                player.move(location)
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
        
      
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        for node in worldLayer.children {
            if node.position.x + node.frame.size.width/2 < 0 {
                node.remove()
                print("node removed")
        
            }
        }
        
        frameCount += 1
        
        pattern?.updateScene()
        

        scroller2?.scroll()
        scrollingBackground?.scroll()
        
        
    }
    
}



