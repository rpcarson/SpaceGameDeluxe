//
//  Mine.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


class Mine: BasicEnemy {
    
    var damage: Double = 50
    
    func spin() {
            self.physicsBody?.applyTorque(50)
    }
    
    override init() {
        super.init()
        
        configure(EnemyTextures.mine.getTexture(), size: CGSize(width: 25, height: 25), health: 10, weapon: nil)
        
        self.physicsBody?.isDynamic = true
        
        enemyType = EnemyTextures.mine
            
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
