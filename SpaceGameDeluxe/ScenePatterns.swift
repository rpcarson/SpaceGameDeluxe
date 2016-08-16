//
//  ScenePatterns.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/31/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit




protocol ScenePattern {
    var actions: [SKAction] { get set }
    var scene: ActionScene { get set }
    var timeOfLastAction: Double { get set }
    mutating func addArrayItem(item: (SKAction, Double))
    mutating func updateScene()
    mutating func compileArray()
}

struct ScenePatternOne: ScenePattern {
    
    var scene: ActionScene
    var actions: [SKAction] = []
    var timeOfLastAction: Double = 0
    var spawn: Spawner {
        return scene.spawner!
    }
    
    internal mutating func compileArray() {
        
        addArrayItem(spawn.makeAction(0, action: spawn.spawnJet(.Middle, speed: 10)))
        
        addArrayItem(spawn.makeAction(timeOfLastAction + 3, action: spawn.spawnJet(.Top, speed: 10)))
        
        addArrayItem(spawn.makeAction(timeOfLastAction + 3, action: spawn.spawnJet(.Bottom, speed: 10)))
        
        addArrayItem(spawn.makeAction(timeOfLastAction + 5, action: spawn.spawnJet(.MidTop, speed: 10)))
        
    }
    internal mutating func addArrayItem(item: (SKAction, Double)) {
        timeOfLastAction = item.1
        actions.append(item.0)
        
    }

    
    mutating func updateScene() {
        let count = scene.frameCount
        
        if count == 90 {
            let group = SKAction.group(actions)
            scene.worldLayer.runAction(group)
        }
        
        
        
    }
    
    init(scene: ActionScene) {
        self.scene = scene
        compileArray()
    }
}

extension ScenePattern {
    
    
}







/*
 
 func minionApproach(spawnPoint: CGPoint) {
 let minionApproach = BasicApproach(node: Minion(), scene: scene, spawnPoint: spawnPoint)
 minionApproach.run()
 }
 
 func mineApproach(spawnPoint: CGPoint) {
 let minionApproach = BasicApproach(node: Mine(), scene: scene, spawnPoint: spawnPoint)
 minionApproach.run()
 }
 
 func spawn(enemy: BasicEnemy.Type,behavior: Behavior, point: SpawnPoint) {
 //let sprite = enemy(behavior)
 }
 
 */







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












/*
 func minionGo() {
 let minion = Minion()
 
 let block1: () = BasicApproach(node: minion, scene: self.scene, spawnPoint: SpawnPoint.Middle.getPointForNode(minion)).run()
 let blok2: () = minion.weapon!.fire()
 
 let minionApproach = SKAction.runBlock({block1})
 
 let fire = SKAction.runBlock({blok2})
 
 let sequence = SKAction.sequence([minionApproach, fire])
 
 minion.runAction(sequence)
 
 
 }
 
 func minionGo2() {
 let minion = Minion(withBehavior: Approach().pattern)
 
 let block1: () = BasicApproach(node: minion, scene: self.scene, spawnPoint: SpawnPoint.Middle.getPointForNode(minion)).run()
 let blok2: () = minion.weapon!.fire()
 
 let minionApproach = SKAction.runBlock({block1})
 
 let fire = SKAction.runBlock({blok2})
 
 let sequence = SKAction.sequence([minionApproach, fire])
 
 minion.runAction(sequence)
 
 
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
 
 
 
 
 */
