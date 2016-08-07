//
//  ScenePatterns.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/31/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

protocol ScenePattern {
    var scene: SKScene { get set }
    var delegate: ActionScene? { get set }
    func updateScene()
}

extension ScenePattern {
    typealias MinionApproach = BasicEnemy
}



protocol EnemySprite {
    var sprite: BasicEnemy { get set }
    var behavior: Behavior { get set }
    var firingPattern: FiringPattern { get set }
}

protocol SceneComponent {
    var node: EnemySprite { get set }
    var spawnPoint: CGPoint { get }
    var time: Double { get set }
}

struct TestComponent: SceneComponent {
    var node: EnemySprite = SpriteWithBehavior(sprite: Minion(), behavior: Approach(), firingPattern: BurstThree())
    var spawnPoint: CGPoint {
       return SpawnPoint.Middle.getPointForNode(node as! SKSpriteNode)
    }
    var time: Double = 5
    
    
    
}

struct SpriteWithBehavior: EnemySprite {
    var sprite: BasicEnemy
    var behavior: Behavior
    var firingPattern: FiringPattern
    
    init(sprite: BasicEnemy, behavior: Behavior, firingPattern: FiringPattern) {
        self.sprite = sprite
        self.behavior = behavior
        self.firingPattern = firingPattern
    }
}

struct PatternOne: ScenePattern {
    
    var scene: SKScene
    
    var delegate: ActionScene?
        
    func minionApproach(spawnPoint: CGPoint) {
        let minionApproach = BasicApproach(node: Minion(), scene: scene, spawnPoint: spawnPoint)
        minionApproach.run()
    }
    
    func mineApproach(spawnPoint: CGPoint) {
        let minionApproach = BasicApproach(node: Mine(), scene: scene, spawnPoint: spawnPoint)
        minionApproach.run()
    }
    
    
    func minionGo() {
        let minion = Minion()
        
        let block1: () = BasicApproach(node: minion, scene: self.scene, spawnPoint: SpawnPoint.Middle.getPointForNode(minion)).run()
        let blok2: () = minion.weapon!.fire()
        
        let minionApproach = SKAction.runBlock({block1})
        
        let fire = SKAction.runBlock({blok2})
        
        let sequence = SKAction.sequence([minionApproach, fire])
        
        minion.runAction(sequence)
        
        print("seq")
        
    }
    
    func updateScene() {
        if let count = delegate?.frameCount {
            
            /*
            if count % 25 == 0 {
              BasicApproach(node: BasicEnemy(), scene: scene, spawnPoint: SpawnPoint.Middle.getPointForNode(BasicEnemy())).run()
            }
            
            
            if count % 100 == 0 {
                
                mineApproach(SpawnPoint.Top.getPointForNode(Minion()))
               mineApproach(SpawnPoint.Bottom.getPointForNode(Minion()))
                mineApproach(SpawnPoint.Middle.getPointForNode(Minion()))
               mineApproach(SpawnPoint.MidTop.getPointForNode(Minion()))
                mineApproach(SpawnPoint.MidBottom.getPointForNode(Minion()))
            }
            
            
        
            if count % 75 == 0 {
              
                minionApproach(SpawnPoint.Top.getPointForNode(Minion()))
                minionApproach(SpawnPoint.Bottom.getPointForNode(Minion()))
                minionApproach(SpawnPoint.Middle.getPointForNode(Minion()))
                minionApproach(SpawnPoint.MidTop.getPointForNode(Minion()))
                minionApproach(SpawnPoint.MidBottom.getPointForNode(Minion()))
            }
 */
            if count % 75 == 0 {
                minionGo()
            }
            
            
        }
       // print(delegate?.frameCount)
        
    }
    
    init(scene: SKScene) {
        self.scene = scene
    }
}

