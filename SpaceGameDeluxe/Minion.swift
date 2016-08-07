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
        
        configure(EnemyTextures.Minion.getTexture(), size: CGSize(width: 75, height: 40), health: 5, weapon: BaseGun(owner: self))
        
        name = "minion"
        print(self.position)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

