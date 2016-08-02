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
    var frameCount: Double? { get set }
    var delegate: ActionScene? { get set }
    func updateScene()
}

extension ScenePattern {
    typealias MinionApproach = BasicEnemy
}


struct PatternOne: ScenePattern {
    
    var scene: SKScene
    
    var frameCount: Double?
    
    var delegate: ActionScene?
        
    func minionApproach(spawnPoint: CGPoint) {
        let minionApproach = BasicApproach(node: Minion(), scene: scene, spawnPoint: spawnPoint)
        minionApproach.run()
    }
    
    func mineApproach(spawnPoint: CGPoint) {
        let minionApproach = BasicApproach(node: Mine(), scene: scene, spawnPoint: spawnPoint)
        minionApproach.run()
    }
    
    func updateScene() {
        if let count = delegate?.frameCount {
            
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
            
            
        }
       // print(delegate?.frameCount)
        
    }
    
    init(scene: SKScene) {
        self.scene = scene
    }
}

