//
//  Follower.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/27/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


protocol Follower {
    func followPlayer(_ node: SKSpriteNode, strict: Bool)
}



extension Follower {
    func followPlayer(_ node: SKSpriteNode, strict: Bool) {
        
        let vectorUp = CGVector(dx: 0, dy: 20)
        let vectorDown = CGVector(dx: 0, dy: -20)
        let diff = Player.sharedInstance.position.y - node.position.y
        
        if node.speed == 0 {
            let bool = node.action(forKey: "moveIn")
            print(bool)
            if node.action(forKey: "moveIn") != nil {
                node.removeAction(forKey: "moveIn")
                node.speed = 1
                print("0 and moveIn nil")
            }
            
        }
        
        if strict {
            
            node.position.y = Player.sharedInstance.position.y
        
        } else {
            
            if (diff <= 10) && (diff >= -10) {
                if node.action(forKey: "goUp") != nil {
                    node.removeAction(forKey: "goUp")
                    //print("removing up")
                }
                if node.action(forKey: "goDown") != nil {
                    node.removeAction(forKey: "goDown")
                    // print("removing down")
                }
            }
            
            if Player.sharedInstance.position.y > node.position.y {
                let goUp = SKAction.applyImpulse(vectorUp, duration: 0.5)
                if node.action(forKey: "goUp") == nil {
                    node.run(goUp, withKey: "goUp")
                }
                
            }
            if Player.sharedInstance.position.y < node.position.y {
                let goDown = SKAction.applyImpulse(vectorDown, duration: 0.5)
                if node.action(forKey: "goDown") == nil {
                    node.run(goDown, withKey: "goDown")
                }
                
            }
            
        }
        
    }
    
}
