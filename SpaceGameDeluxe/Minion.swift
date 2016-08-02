//
//  Minion.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit




class Minion: BasicEnemy {
   
    func attack() {
        if let node = weapon?.projectile {
           // node.position = weapon.owner.position
        
            let point = CGPoint(x: 0, y: node.position.y)
            node.position = self.position
           scene!.addChild(node)
            print("is node")
            print(self.scene)
            let action = SKAction.moveTo(point, duration: 1)
            
            let delay = SKAction.waitForDuration(weapon!.rateOfFire)
            let reload = SKAction.waitForDuration(2)
            
            //let fullSequence = SKAction.sequence([action,delay,fireSequence,delay,fireSequence,reload])
            node.runAction(action, withKey: "fire")
        }
        
      
    }
    
    override init() {
        super.init()
        
        configure(EnemyTextures.Minion.getTexture(), size: CGSize(width: 75, height: 40), health: 5, weapon: BasicWeapon(owner: self))
        
        name = "minion"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


/*
 
 override class func getType() -> Minion {
 return Minion()
 }
 
 
 
 */