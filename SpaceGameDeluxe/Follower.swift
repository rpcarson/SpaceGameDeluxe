//
//  Follower.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/27/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

//TODO: tweak delayed follow solution. basis is ok, i think
//TODO: add strict follow

protocol Follower {
    func followPlayer(node: SKSpriteNode, strict: Bool)
}



extension Follower {
    func followPlayer(node: SKSpriteNode, strict: Bool) {
        
        let vectorUp = CGVector(dx: 0, dy: 20)
        let vectorDown = CGVector(dx: 0, dy: -20)
        let diff = Player.sharedInstance.position.y - node.position.y
        
        if node.speed == 0 {
            if node.actionForKey("moveIn") != nil {
                node.removeActionForKey("moveIn")
                node.speed = 1
            }
            
        }
        
        if strict {
            
            node.position.y = Player.sharedInstance.position.y
        
        } else {
            
            if (diff <= 10) && (diff >= -10) {
                if node.actionForKey("goUp") != nil {
                    node.removeActionForKey("goUp")
                    //print("removing up")
                }
                if node.actionForKey("goDown") != nil {
                    node.removeActionForKey("goDown")
                    // print("removing down")
                }
            }
            
            if Player.sharedInstance.position.y > node.position.y {
                let goUp = SKAction.applyImpulse(vectorUp, duration: 0.5)
                if node.actionForKey("goUp") == nil {
                    node.runAction(goUp, withKey: "goUp")
                }
                
            }
            if Player.sharedInstance.position.y < node.position.y {
                let goDown = SKAction.applyImpulse(vectorDown, duration: 0.5)
                if node.actionForKey("goDown") == nil {
                    node.runAction(goDown, withKey: "goDown")
                }
                
            }
            
        }
        
    }
    
}
