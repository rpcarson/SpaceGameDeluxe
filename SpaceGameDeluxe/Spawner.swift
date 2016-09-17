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
    
    
    func spawnTrackingMinion(_ point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.run { SimplePattern(sprite: TrackingMinion(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
        }
    }
    
    func spawnMissileMinion(_ point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.run { SimplePattern(sprite: MissileMinion(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
        }
    }
    
    
    func tripleJetCruiseIn() -> SKAction {
        return SKAction.run {
            SimplePattern(sprite: BasicJet(), behavior: ApproachAndSlow(delay: 1), spawnPoint: .midTop).run(fireDelay: 1, scene: self.scene)
            SimplePattern(sprite: BasicJet(), behavior: ApproachAndSlow(delay: 1.3), spawnPoint: .midBottom).run(fireDelay: 1, scene: self.scene)
            SimplePattern(sprite: BasicJet(), behavior: ApproachAndSlow(delay: 0), spawnPoint: .middle).run(fireDelay: 1, scene: self.scene)
        }
    }
    
    
    func threeMinApproach(_ point: SpawnPoint = .middle, speed: Double = 0, hostile: Bool = true) -> SKAction {
        
        let block = {
            SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.middle).run(scene: self.scene)
            SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.top).run(scene: self.scene)
            SimplePattern(sprite: Minion(), behavior: Approach(duration: 14), spawnPoint: SpawnPoint.bottom).run(scene: self.scene)
        }
        
        return SKAction.run(block)
    }
    
    func spawnMinion(_ point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.run { SimplePattern(sprite: Minion(), behavior: Approach(duration: speed), spawnPoint: point).run(hostile, fireDelay: 1, scene: self.scene)
        }
    }
    
    func spawnJet(_ point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.run { SimplePattern(sprite: BasicJet(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
        }
    }
    
    func cruiseJet(_ point: SpawnPoint, speed: Double, hostile: Bool = true) -> SKAction {
        return SKAction.run { SimplePattern(sprite: BasicJet(), behavior: ApproachAndSlow(), spawnPoint: point).run(scene: self.scene)
        }
    }
    
    
    
    func runCustomPattern(_ enemy: EnemyType, behavior: Behavior, spawnPoint: SpawnPoint, fireDelay: Double, hostile: Bool) -> SKAction {
        return SKAction.run {
           SimplePattern(sprite: enemy.enemy(), behavior: behavior, spawnPoint: spawnPoint).run(hostile, fireDelay: fireDelay, scene: self.scene)
        }
    }
    
    
    func spawnFollowerEnemy(_ enemy: BasicEnemy, point: SpawnPoint, hostile: Bool = true) -> (SKAction, SKSpriteNode) {
    
    let node = enemy
    
    return (SKAction.run {
        FollowerPattern(sprite: node, behavior: MoveInAndFollowPlayer(), spawnPoint: SpawnPoint.middle).run(hostile, fireDelay: 0, scene: self.scene)
        
    }, node)
    
    }
    
    func spawnApproach(_ enemy: EnemyType, point: SpawnPoint, speed: Double, hostile: Bool) -> SKAction {
        return SKAction.run {
            SimplePattern(sprite: enemy.enemy(), behavior: Approach(duration: speed), spawnPoint: point).run(scene: self.scene)
            
        }
    }
    
    func spawnMine(_ point: SpawnPoint, speed: Double, offset: CGFloat) -> SKAction {
        return SKAction.run {
            MinePattern(sprite: Mine(), behavior: Approach(duration: speed), spawnPoint: point).run(false, scene: self.scene, offset: offset)
        }
    }
    
    
    
    
    
    
    func spawnEvasive(_ point: SpawnPoint, toPoint: SpawnPoint, enemy: BasicEnemy, speed: Double, offset: CGFloat, evadeDelay: Bool) -> SKAction {
        
        return SKAction.run {
            EvasivePattern(sprite: enemy, behavior: Approach(), spawnPoint: point).run(true, fireDelay: 0, scene: self.scene, speed: speed, toPoint: toPoint, offset: offset, evadeDelay: evadeDelay)
    }
        
    }
    
    func evadeLate(_ point: SpawnPoint, toPoint: SpawnPoint, enemy: BasicEnemy, speed: Double, offset: CGFloat) -> SKAction {
        
        return SKAction.run {
            EvadeLate(sprite: enemy, behavior: Approach(), spawnPoint: point).run(true, fireDelay: 0, scene: self.scene, speed: speed, toPoint: toPoint, offset: offset)
        }
        
    }
    

    
    init(actionScene: ActionScene) {
        self.scene = actionScene
    }
    
    
}





