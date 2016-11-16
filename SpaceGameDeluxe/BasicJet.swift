//
//  BasicJet.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/15/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

class BasicJet: BasicEnemy {
    
    override init() {
        super.init()
        
       // let burst = Burst(shotsInBurst: 5, burstSpeed: 0.25, timeBetween: 1)
       // let weapon = BaseGun(owner: self, pattern: burst, tracking: false)
        
        configure(EnemyTraits.jet.getTexture(), size: CGSize(width: 68, height: 45), health: EnemyTraits.jet.healthValue, weapon: Autocannon(owner: self))
        
        enemyType = EnemyTraits.jet
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
