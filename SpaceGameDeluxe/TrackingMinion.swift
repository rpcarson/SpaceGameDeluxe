//
//  TrackingMinion.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/16/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class TrackingMinion: BasicEnemy, Follower {
 
    override init() {
        super.init()
        
        let burster = Burst(shotsInBurst: 3, burstSpeed: 1, timeBetween: 2)
                
        configure(EnemyTextures.squareJet.getTexture(), size: CGSize(width: 75, height: 40), health: EnemyTextures.squareJet.healthValue, weapon: BasicEnergyGun(owner: self, pattern: burster, tracking: true))
        
        enemyType = EnemyTextures.squareJet
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
