//
//  PhysicsBoundary.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/8/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class PhysicsBoundary: SKSpriteNode {
    
    
    func setup() {
        physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        position = self.scene!.position
        physicsBody?.categoryBitMask = MaskValue.boundary
        physicsBody?.contactTestBitMask = MaskValue.playerProjectile | MaskValue.enemyProjectile
        name = "boundary"
        hidden = true
    }
   
}
