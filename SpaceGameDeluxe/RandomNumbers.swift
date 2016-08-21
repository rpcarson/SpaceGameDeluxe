//
//  RandomNumbers.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/20/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit
import GameKit

struct RandomNumbers {
    
    static func getRandomTo10() -> CGFloat {
        return CGFloat(GKRandomSource.sharedRandom().nextIntWithUpperBound(10))
    }
   
    static func randomXFromLeft(inScene scene: SKScene) -> CGFloat {
        
        let sceneXInt = Int(scene.size.width)
        let random = GKRandomSource.sharedRandom().nextIntWithUpperBound(sceneXInt)
        return CGFloat(random)
        
        
    }
    
    static func randomXForObject(inScene scene: SKScene, object: SKSpriteNode) -> CGFloat {
        
        let buffer =  Int(object.size.width)
        
        let upperBounds = Int(scene.frame.width) - buffer
        
        let randomRange = GKRandomSource.sharedRandom().nextIntWithUpperBound(upperBounds)
        
        return CGFloat(randomRange + buffer/2)
        
    }
    static func randomYForObject(inScene scene: SKScene, object: SKSpriteNode) -> CGFloat {
        
        let buffer =  Int(object.size.height)
        
        let upperBounds = Int(scene.frame.height) - buffer
        
        let randomRange = GKRandomSource.sharedRandom().nextIntWithUpperBound(upperBounds)
        
        return CGFloat(randomRange + buffer/2)
        
    }
    
}







