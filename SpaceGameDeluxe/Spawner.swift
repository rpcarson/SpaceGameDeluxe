//
//  Spawner.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/15/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit



struct Spawner {
    var scene: ActionScene
    
    func threeMinApproach(point: SpawnPoint = .Middle, speed: Double = 0, hostile: Bool = true) {
        SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.Middle).run(scene: scene)
        SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.Top).run(scene: scene)
        SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.Bottom).run(scene: scene)
    }
    
    func spawnMinion(point: SpawnPoint, speed: Double, hostile: Bool = true) {
        SimplePattern(sprite: Minion(), behavior: Approach(duration: speed), spawnPoint: point).run(hostile, scene: scene)
    }
    
    
    func spawnJet(point: SpawnPoint, speed: Double, hostile: Bool = true) {
        SimplePattern(sprite: BasicJet(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: scene)
    }
    
    func spawnJet(point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        let block = {
             SimplePattern(sprite: BasicJet(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
        }
        
        return SKAction.runBlock(block)
    }
    
    func makeAction(wait: Double, action: SKAction) -> (SKAction, Double) {
        let delay = SKAction.waitForDuration(wait)
        return (SKAction.sequence([delay, action]), wait)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    init(actionScene: ActionScene) {
        self.scene = actionScene
    }
    
    
}





