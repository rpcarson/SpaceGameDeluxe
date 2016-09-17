//
//  PhysicsBoundary.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/8/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class PhysicsBoundary: SKSpriteNode {
    
    func getDimensions() {
        let dimensions = self.size
        print("size = \(dimensions)")
        
        let _frame = self.frame
        print("frame = \(_frame)")
        
        print("scene size = \(self.scene?.size)")
        print("scene frame = \(self.scene?.frame)")
    }
    
    
    func setup() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        position = self.scene!.position
        physicsBody?.categoryBitMask = MaskValue.boundary
        physicsBody?.contactTestBitMask = MaskValue.playerProjectile | MaskValue.enemyProjectile
        name = "boundary"
        isHidden = true
    }
   
}
