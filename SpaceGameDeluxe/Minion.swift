//
//  Minion.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class Minion: BasicEnemy {
    
    override init() {
        super.init()
        
      //  let burst = Burst(shotsInBurst: 3, burstSpeed: BurstSpeed.fast.rawValue, timeBetween: 2)
        
      //  let wep = BaseGun(owner: self, pattern: burst, tracking: false)
        
       // let wep2 = Autocannon(owner: self)
        
        configure(EnemyTraits.minion.getTexture(), size: CGSize(width: 54, height: 25), health: EnemyTraits.minion.healthValue, weapon: BaseGun(owner: self))
        
        enemyType = EnemyTraits.minion
   

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class MissileMinion: BasicEnemy {
    
    override init() {
        super.init()
        
       configure(EnemyTraits.minion.getTexture(), size: CGSize(width: 75, height: 40), health: EnemyTraits.minion.healthValue, weapon: BaseGun(owner: self))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

