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
    
    
    func spawnTrackingMinion(point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.runBlock { SimplePattern(sprite: TrackingMinion(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
        }
    }
    
    func spawnMissileMinion(point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.runBlock { SimplePattern(sprite: MissileMinion(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
        }
    }
    
    
    func tripleJetCruiseIn() -> SKAction {
        return SKAction.runBlock {
            SimplePattern(sprite: BasicJet(), behavior: ApproachAndSlow(delay: 1), spawnPoint: .MidTop).run(fireDelay: 1, scene: self.scene)
            SimplePattern(sprite: BasicJet(), behavior: ApproachAndSlow(delay: 1.3), spawnPoint: .MidBottom).run(fireDelay: 1, scene: self.scene)
            SimplePattern(sprite: BasicJet(), behavior: ApproachAndSlow(delay: 0), spawnPoint: .Middle).run(fireDelay: 1, scene: self.scene)
        }
    }
    
    
    func threeMinApproach(point: SpawnPoint = .Middle, speed: Double = 0, hostile: Bool = true) -> SKAction {
        
        let block = {
            SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.Middle).run(scene: self.scene)
            SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.Top).run(scene: self.scene)
            SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.Bottom).run(scene: self.scene)
        }
        
        return SKAction.runBlock(block)
    }
    
    func spawnMinion(point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.runBlock { SimplePattern(sprite: Minion(), behavior: Approach(duration: speed), spawnPoint: point).run(hostile, fireDelay: 1, scene: self.scene)
        }
    }
    
    func spawnJet(point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.runBlock { SimplePattern(sprite: BasicJet(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
        }
    }
    
    func cruiseJet(point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.runBlock { SimplePattern(sprite: BasicJet(), behavior: ApproachAndSlow(), spawnPoint: point).run(scene: self.scene)
        }
    }
    
    
    
    func runCustomPattern(enemy: EnemyType, behavior: Behavior, spawnPoint: SpawnPoint, fireDelay: Double, hostile: Bool) -> SKAction {
        return SKAction.runBlock {
           SimplePattern(sprite: enemy.enemy(), behavior: behavior, spawnPoint: spawnPoint).run(hostile, fireDelay: fireDelay, scene: self.scene)
        }
    }
    
    
   func spawnFollowerEnemy(enemy: BasicEnemy, point: SpawnPoint, hostile: Bool = true) -> (SKAction, SKSpriteNode) {
    
    let node = enemy
    
    return (SKAction.runBlock {
        FollowerPattern(sprite: node, behavior: MoveInAndFollowPlayer(), spawnPoint: SpawnPoint.Middle).run(scene: self.scene)
        
    }, node)
    
    }
    
    func spawnApproach(enemy: EnemyType, point: SpawnPoint, speed: Double, hostile: Bool) -> SKAction {
        return SKAction.runBlock {
            SimplePattern(sprite: enemy.enemy(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
            
        }
    }
    
    func spawnMine(point: SpawnPoint, speed: Double) -> SKAction {
        return SKAction.runBlock {
            MinePattern(sprite: Mine(), behavior: Approach(duration: speed), spawnPoint: point).run(false, scene: self.scene)
        }
    }
    

    
    init(actionScene: ActionScene) {
        self.scene = actionScene
    }
    
    
}





