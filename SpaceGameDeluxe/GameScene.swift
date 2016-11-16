//
//  GameScene.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/13/16.
//  Copyright (c) 2016 Reed Carson. All rights reserved.
//

import SpriteKit

protocol ActionScene {
    
    var masterLevelController: MasterLevelController? { get set }
    
    var frameCount: Double { get set }
   // var pattern: ScenePattern? { get set }
   // var spawner: Spawner? { get set }
    var worldLayer: WorldLayer { get  }
    var hudLayer: HUDLayer { get  }
    var backgroundLayer: BackgroundLayer { get  }
    var actorLayer: ActorLayer { get  }
    var projectileLayer: ProjectileLayer { get  }
    var zoneLayer: ZoneLayer { get  }
    
   
    
}



class GameScene: SKScene, ActionScene {
    
    
    var masterLevelController: MasterLevelController?
    
   // var scrollingBackground: Scroller?
   // var scroller2: Scroller?
    
   // var spawner: Spawner?
    
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
    
   // var pattern: ScenePattern?
    
    var moveZone: SKShapeNode!
    var fireZone: SKShapeNode!
    var nullZone: SKShapeNode!
    
    var timer: Timer!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let player = Player.sharedInstance
    
  //  var scrolling: TestBackground?
    
    override func didMove(to view: SKView) {
       // size.width = UIScreen.main.bounds.width
        // size.height = UIScreen.main.bounds.height
        
        setupScene()
        
        worldLayer.speed = simulationSpeed        
    
 
    }
    
 
    
    func setupScene() {
        setupLayers()
        setupTouchZones()
        setupPhysics()
        setupBoundary()
        addPlayer()
        loadLevel()
        
        backgroundColor = UIColor.black
        
    }
    
  
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if nullZone.contains(location) {
                endFiring()
            }
            if fireZone.contains(location) {
                fireTouchLocation = location
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if fireZone.contains(location) {
                fireTouchLocation = location
                startFiring()
            }
            if moveZone.contains(location) {
                player.move(location)
            }
            if nullZone.contains(location) {
                endFiring()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if fireZone.contains(location) || nullZone.contains(location) {
                endFiring()
            }
        }
    }

    
    func keepPlayerInBounds() {
        if player.position.y < player.size.height/2 {
            player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            player.position.y = player.size.height/2 + 1
        }
        
        if player.position.y > self.size.height - player.size.height/2 {
            player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            player.position.y = self.size.height - player.size.height/2 - 1
        }
    }
    
    func cullNodes() {
        for node in worldLayer.children {
            if node.position.x + node.frame.size.width/2 < 0 {
                node.remove()
                // print("node removed")
                
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        frameCount += 1
        
        keepPlayerInBounds()
      
        cullNodes()
        
        masterLevelController?.run()
    
    }
    
}



