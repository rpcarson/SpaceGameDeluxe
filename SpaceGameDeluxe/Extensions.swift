//
//  Extensions.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


extension SKNode {
    func remove() {
        self.physicsBody = nil
        self.removeAllActions()
        self.removeFromParent()
    }
}

extension GameScene {
    
    func startFiring() {
        guard let weapon = player.weapon else { return }
        fire()
        timer = NSTimer.scheduledTimerWithTimeInterval(weapon.weaponType.rateOfFire, target: self, selector: #selector(GameScene.fire), userInfo: nil, repeats: true)
    }
    func endFiring() {
        if timer != nil {
            timer.invalidate()
        }
    }
    
    func fire() {
        player.firePrimary()
    }
}

extension GameScene {
    
    
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
        moveZone.position = movePosition
        
        fireZone = SKShapeNode(rectOfSize: fireSize)
        fireZone.fillColor = UIColor.redColor()
        fireZone.zPosition = 10
        fireZone.position = firePosition
        
        nullZone = SKShapeNode(rectOfSize: nullSize)
        nullZone.fillColor = UIColor.grayColor()
        nullZone.zPosition = 10
        nullZone.position = nullPosition
        
        if debugMode {
            moveZone.alpha = 0.25
            fireZone.alpha = 0.5
            nullZone.alpha = 0.3
        } else {
            moveZone.hidden = true
            fireZone.hidden = true
            nullZone.hidden = true
        }
        
        zoneLayer.addChild(nullZone)
        zoneLayer.addChild(fireZone)
        zoneLayer.addChild(moveZone)
        
    }
    
}

extension GameScene {
    func setupLayers() {
        addChild(backgroundLayer)
        addChild(worldLayer)
        addChild(hudLayer)
        addChild(zoneLayer)
        
        worldLayer.addChild(actorLayer)
        worldLayer.addChild(projectileLayer)
    }
    
    func loadPattern() {
        pattern = ScenePatternOne(scene: self)
    }
    
    func setupBoundary() {
        boundary.color = SKColor.redColor()
        boundary.size = CGSize(width: self.frame.width * 2, height: self.frame.height*2)
        addChild(boundary)
        boundary.setup()
        
    }
    
    func setupPhysics() {
        physicsWorld.contactDelegate = contactHandler
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }
    
    func addPlayer() {
        let position = CGPoint(x: player.size.width / 2 + 10, y: self.frame.height/2)
        player.position = position
        worldLayer.addChild(player)
        
    }
}

