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
    var spritesNeedUpdate: [SKSpriteNode] { get set }
    
    mutating func updateScene()
    mutating func compilePattern()
}

struct ScenePatternOne: ScenePattern {
    
    var spritesNeedUpdate: [SKSpriteNode] = []
    
    var scene: ActionScene
    var actions: [SKAction] = []
    var timeOfLastAction: Double = 0
    var totalTimeElapsed: Double = 0
    
    var totalRunTime: Double {
        return timeOfLastAction
    }
    var spawn: Spawner {
        return Spawner(actionScene: scene)
    }
    
    func runPattern() {
        let group = SKAction.group(actions)
        scene.worldLayer.run(group)
    }
    
    mutating func compilePattern() {
        
        
        
        
        
        addPatternComponent(spawn.spawnMinion(.middle, speed: 10), wait: 0)
            addPatternComponent(spawn.spawnMinion(.fourTenths, speed: 10), wait: 1)
            addPatternComponent(spawn.spawnMinion(.sixTenths, speed: 10), wait: 0)
            addPatternComponent(spawn.spawnMinion(.eightTenths, speed: 10), wait: 1)
            addPatternComponent(spawn.spawnMinion(.twoTenths, speed: 10), wait: 0)
        
        
      
        addPatternComponent(spawn.spawnMinion(.twoTenths, speed: 12), wait: 2)
         addPatternComponent(spawn.spawnMinion(.threeTenths, speed: 12), wait: 0.75)
         addPatternComponent(spawn.spawnMinion(.oneTenth, speed: 12), wait: 0)
         addPatternComponent(spawn.spawnMinion(.fourTenths, speed: 12), wait: 0.75)
        
        
        addPatternComponent(spawn.spawnMinion(.eightTenths, speed: 12), wait: 4)
        addPatternComponent(spawn.spawnMinion(.sevenTenths, speed: 12), wait: 0.75)
        addPatternComponent(spawn.spawnMinion(.nineTenths, speed: 12), wait: 0)
        addPatternComponent(spawn.spawnMinion(.sixTenths, speed: 12), wait: 0.75)
        
        addPatternComponent(spawn.spawnMine(.middle, speed: 25, offset: 0), wait: 0)
        addPatternComponent(spawn.spawnMine(.middle, speed: 25, offset: 20), wait: 0)
        addPatternComponent(spawn.spawnMine(.middle, speed: 25, offset: -20), wait: 0)
        addPatternComponent(spawn.spawnMine(.middle, speed: 25, offset: -40), wait: 0.5)
            addPatternComponent(spawn.spawnMine(.middle, speed: 25, offset: 40), wait: 0)
            addPatternComponent(spawn.spawnMine(.middle, speed: 25, offset: 0), wait: 0.5)
        
        
        
        addPatternComponent(spawn.evadeLate(.sixTenths, toPoint: .eightTenths, enemy: Minion(), speed: 15, offset: 0), wait: 2)
        addPatternComponent(spawn.evadeLate(.sixTenths, toPoint: .nineTenths, enemy: Minion(), speed: 15, offset: 20), wait: 0.4)
        addPatternComponent(spawn.evadeLate(.sixTenths, toPoint: .top, enemy: Minion(), speed: 15, offset: 40), wait: 0.4)
        
        


        addPatternComponent(spawn.spawnEvasive(.middle, toPoint: .midTop, enemy: Minion(), speed: 12, offset: 20, evadeDelay: true), wait: 2)
        addPatternComponent(spawn.spawnEvasive(.middle, toPoint: .midBottom, enemy: Minion(), speed: 12, offset: -20, evadeDelay: true), wait: 0)
        addPatternComponent(spawn.spawnApproach(EnemyType.minion, point: .middle, speed: 12, hostile: true), wait: 1)
        
        
        addPatternComponent(spawn.spawnEvasive(.midTop, toPoint: .fourTenths, enemy: Minion(), speed: 15, offset: 0, evadeDelay: false), wait: 5)
        addPatternComponent(spawn.spawnEvasive(.midBottom, toPoint: .sixTenths, enemy: Minion(), speed: 15, offset: 0, evadeDelay: false), wait: 0)
        
        addPatternComponent(spawn.cruiseJet(.eightTenths, speed: 0), wait: 4)
         addPatternComponent(spawn.cruiseJet(.sevenTenths, speed: 0), wait: 1)
         addPatternComponent(spawn.cruiseJet(.sixTenths, speed: 0), wait: 0.3)
        
        addFollowerComponent(spawn.spawnFollowerEnemy(TrackingMinion(), point: .middle), wait: 4)
        
        addPatternComponent(spawn.spawnEvasive(.sevenTenths, toPoint: .threeTenths, enemy: Minion(), speed: 10, offset: 0, evadeDelay: false), wait: 4)
        
        
        
        
        addPatternComponent(spawn.spawnMine(.top, speed: 25, offset: 0), wait: 0)
        addPatternComponent(spawn.spawnMine(.bottom, speed: 25, offset: 0), wait: 0)
        
        addPatternComponent(spawn.spawnMine(.nineTenths, speed: 25, offset: 0), wait: 0.5)
        addPatternComponent(spawn.spawnMine(.oneTenth, speed: 25, offset: 0), wait: 0)
        
        addPatternComponent(spawn.cruiseJet(.eightTenths, speed: 0), wait: 1)
        addPatternComponent(spawn.cruiseJet(.twoTenths, speed: 0), wait: 0)
        
        addPatternComponent(spawn.spawnMinion(.middle, speed: 7, hostile: false), wait: 2)
        addPatternComponent(spawn.spawnMinion(.fourTenths, speed: 7, hostile: false), wait: 0.4)
        addPatternComponent(spawn.spawnMinion(.sixTenths, speed: 7, hostile: false), wait: 0.0)
        
        

        
        
     //   addFollowerComponent(spawn.spawnFollowerEnemy(TrackingMinion(), point: .Middle), wait: 1)

      
        
        
        /*
        
        addPatternComponent(spawn.spawnJet(.TopMinus20, speed: 20), wait: 4)
        addPatternComponent(spawn.spawnJet(.BottomPlus20, speed: 20), wait: 0)

        
        
        addPatternComponent(spawn.spawnMinion(.Top, speed: 20), wait: 2)
        addPatternComponent(spawn.spawnMinion(.Bottom, speed: 20), wait: 0)
        
        addPatternComponent(spawn.threeMinApproach(), wait: 5)
        
        addPatternComponent(spawn.cruiseJet(.MidBottom, speed: 5, hostile: false), wait: 2)
        
        addPatternComponent(spawn.cruiseJet(.MidBottom, speed: 5, hostile: false), wait: 0)

*/
        
        /*
         addPatternComponent(spawn.spawnMinion(.MidTop, speed: 12), wait: 0)
        
         addPatternComponent(spawn.spawnMinion(.MidBottom, speed: 12), wait: 1)
         addPatternComponent(spawn.spawnMinion(.Middle, speed: 12), wait: 1)
         addPatternComponent(spawn.spawnMinion(.Top, speed: 12), wait: 1)
         addPatternComponent(spawn.spawnMinion(.Bottom, speed: 12), wait: 1)
        
        addPatternComponent(spawn.spawnTrackingMinion(.Top, speed: 20), wait: 0)
        addPatternComponent(spawn.spawnTrackingMinion(.Middle, speed: 20), wait: 0)
        addPatternComponent(spawn.spawnMinion(.Bottom, speed: 20), wait: 0)
        
        addPatternComponent(spawn.spawnTrackingMinion(.MidTop, speed: 12), wait: 5)
        addPatternComponent(spawn.spawnMinion(.MidBottom, speed: 12), wait: 0)
        
        addPatternComponent(spawn.spawnMissileMinion(.Top, speed: 25), wait: 3)
        addPatternComponent(spawn.spawnTrackingMinion(.Bottom, speed: 25), wait: 0)
        
        addPatternComponent(spawn.runCustomPattern(EnemyType.basicJet, behavior: Approach(duration: 40), spawnPoint: .Middle, fireDelay: 2, hostile: true), wait: 2)
        
        addPatternComponent(spawn.spawnApproach(EnemyType.basicEnemy, point: .Middle, speed: 20, hostile: true), wait: 2)
        
      */
        
        /*
         addPatternComponent(spawn.spawnMinion(.MidBottom, speed: 20), wait: 0)
         addPatternComponent(spawn.spawnMinion(.MidTop, speed: 20), wait: 2)
         addPatternComponent(spawn.spawnTrackingMinion(.MidBottom, speed: 20), wait: 0)
         addPatternComponent(spawn.spawnMinion(.MidTop, speed: 20), wait: 2)
         addPatternComponent(spawn.spawnMinion(.MidBottom, speed: 20), wait: 0)
         addPatternComponent(spawn.spawnMinion(.MidTop, speed: 20), wait: 2)
         addPatternComponent(spawn.spawnMinion(.MidBottom, speed: 20), wait: 0)
         */
    }
    
    typealias PatternComponent = SKAction
    
    fileprivate mutating func createPatternComponent(_ wait: Double, action: SKAction) -> (PatternComponent) {
        let time = wait + timeOfLastAction
        let delay = SKAction.wait(forDuration: time)
        timeOfLastAction = time
        return (SKAction.sequence([delay, action]))
    }
    
    fileprivate mutating func addPatternComponent(_ action: SKAction, wait: Double) {
        let component = createPatternComponent(wait, action: action)
        actions.append(component)
    }
    
    fileprivate mutating func addFollowerComponent(_ tuple: (SKAction, SKSpriteNode), wait: Double) {
        let component = createPatternComponent(wait, action: tuple.0)
        let node = tuple.1
        spritesNeedUpdate.append(node)
        actions.append(component)
        
    }
    
    
    mutating func updateScene() {
        let count = scene.frameCount
        
        if count.truncatingRemainder(dividingBy: 30) == 0 {
            totalTimeElapsed += 1
            print(totalTimeElapsed)
        }
        
        if count == 30 {
            runPattern()
        }
        

            for x in spritesNeedUpdate {
                if scene.worldLayer.children.contains(x) {
                    if x is Follower {
                        (x as! Follower).followPlayer(x, strict: false)
                    }
                }
               
       
        }
        
    }
    
    
//    func followPlayer(node: SKSpriteNode) {
//        let vectorUp = CGVector(dx: 0, dy: 3)
//        let vectorDown = CGVector(dx: 0, dy: -3)
//        if Player.sharedInstance.position.y > node.position.y {
//            node.physicsBody?.applyImpulse(vectorUp)
//
//        } else if Player.sharedInstance.position.y < node.position.y {
//            node.physicsBody?.applyImpulse(vectorDown)
//
//        }
//
//    }
    
    init(scene: ActionScene) {
        self.scene = scene
        compilePattern()
        print(totalRunTime)
    }
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
