//
//  MinionGun.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/30/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class MinionGun: BasicWeapon {
    
    let _projectileSize = CGSize(width: 8, height: 4)
    let _projectileSpeed = ProjectileSpeed.Medium.rawValue
    
    override func fire() {
        
        let scene = owner.scene
    
        let point = CGPoint(x: -projectile.size.width, y: projectile.position.y)
        let move = SKAction.moveTo(point, duration: 0.5)
        let despawn = SKAction.removeFromParent()
        let fireSequence = SKAction.sequence([move,despawn])
        
        let delay = SKAction.waitForDuration(rateOfFire)
        let reload = SKAction.waitForDuration(2)
        
        let fullSequence = SKAction.sequence([fireSequence,delay,fireSequence,delay,fireSequence,reload])
        
        let repeatSequence = SKAction.repeatActionForever(fullSequence)
        
        if let node = projectile as? SKShapeNode {
            scene!.addChild(node)
           // node.runAction(fireSequence)
        }
    }
    
    override init(owner: SKSpriteNode) {
        super.init(owner: owner)
        self.owner = owner

        configureWeapon(2, ammoCount: 0, rateOfFire: 0.25, projectileSize: _projectileSize, projectileSpeed: _projectileSpeed)
    }

    
}
