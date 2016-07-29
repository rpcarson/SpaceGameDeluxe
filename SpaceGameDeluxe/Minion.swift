//
//  Minion.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit



class Minion: BasicEnemy {
    
    let minionTexture = SKTexture(imageNamed: "stupidAssMinion1")
    
    override class func getType() -> Minion {
        return Minion()
    }
    
    override init() {
        super.init()
        spriteTexture = SKTexture(imageNamed: EnemyTextures.Minion.rawValue)

        setupSprite()
        
        health = 5
        
        print("Minion contact mask == \(physicsBody!.contactTestBitMask)")
        print("\(MaskValue.projectile)")
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}