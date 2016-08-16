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
      //  let spin = SKAction.applyTorque(RandomNumbers.getRandomTo10()/10, duration: 10)
       // self.runAction(spin)
        
        print("spinning")
    }
    
    override init() {
        super.init()
        
        configure(EnemyTextures.Mine.getTexture(), size: CGSize(width: 50, height: 50), health: 10, weapon: nil)
        
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 0))
        
        spin()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}