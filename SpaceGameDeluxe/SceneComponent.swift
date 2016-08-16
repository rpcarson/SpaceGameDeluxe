//
//  SceneComponent.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/12/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


/*

struct SceneComponent {
    var id: Int
    var pattern: Pattern
    var delay: Double
    var scene: ActionScene
    var scenePattern: ScenePattern
    
    var subsequentAction: SceneComponent? {
        return scenePattern.componentDictionary[id + 1]
    }
    
    func run() {
        let patternBlock: () = pattern.run(true, scene: scene)
        
        let runPattern = SKAction.runBlock({patternBlock})
        //  let delay = SKAction.waitForDuration(delay)
        
        if let subsequentComponent = scenePattern.componentDictionary[id + 1] {
            print("ID  \(id)")
            scene.worldLayer.runAction(runPattern) {
             subsequentComponent.pattern.run(true, scene: self.scene)
                print("running component \(self.id)")
            }
        } else {
            scene.worldLayer.runAction(runPattern, withKey: "\(id)")
            print("running component \(self.id) no closure")
        }
        
    }
    
}

*/

