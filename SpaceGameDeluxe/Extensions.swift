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
        fire()
        timer = NSTimer.scheduledTimerWithTimeInterval(player.weapon!.rateOfFire, target: self, selector: #selector(GameScene.fire), userInfo: nil, repeats: true)
    }
    func endFiring() {
        if timer != nil {
            timer.invalidate()
        }
    }
    
    func fire() {
        player.firePrimary(self)
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
        
        self.scene?.addChild(nullZone)
        self.scene?.addChild(fireZone)
        self.scene?.addChild(moveZone)
        
    }
    
}