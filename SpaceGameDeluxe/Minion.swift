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
        
        let burster = Burst(shotsInBurst: 5, burstSpeed: 10, timeBetween: 3)
        
        let missile = Burst(shotsInBurst: 1, burstSpeed: 1, timeBetween: 5)
        
        configure(EnemyTextures.Minion.getTexture(), size: CGSize(width: 75, height: 40), health: EnemyTextures.Minion.healthValue, weapon: BaseGun(tracking: false, owner: self))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class MissileMinion: BasicEnemy {
    
    override init() {
        super.init()
        
        let burster = Burst(shotsInBurst: 5, burstSpeed: 10, timeBetween: 3)
        
        let missile = Burst(shotsInBurst: 1, burstSpeed: 1, timeBetween: 5)
        
       configure(EnemyTextures.Minion.getTexture(), size: CGSize(width: 75, height: 40), health: EnemyTextures.Minion.healthValue, weapon: BaseGun(owner: self))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

