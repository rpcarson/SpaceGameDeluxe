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
        
        configure(EnemyTextures.Jet.getTexture(), size: CGSize(width: 75, height: 50), health: EnemyTextures.Jet.healthValue, weapon: BaseGun(owner: self))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
