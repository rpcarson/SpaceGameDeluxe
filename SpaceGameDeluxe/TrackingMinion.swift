//
//  TrackingMinion.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/16/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class TrackingMinion: BasicEnemy {
 
    override init() {
        super.init()
        
        let burster = Burst(shotsInBurst: 3, burstSpeed: 5, timeBetween: 1.5)
        
        configure(EnemyTextures.SquareJet.getTexture(), size: CGSize(width: 75, height: 40), health: EnemyTextures.SquareJet.healthValue, weapon: BaseGun(tracking: true, owner: self))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
