//
//  SpritePattern.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/12/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit



protocol Pattern {
    var sprite: BasicEnemy { get set }
    var behavior: Behavior { get set }
    var spawnPoint: SpawnPoint { get set }
    
    func spawn(actionScene: ActionScene, offSet: CGFloat)
    func run(hostile: Bool, scene: ActionScene)
    init(sprite: BasicEnemy, behavior: Behavior, spawnPoint: SpawnPoint)
}

extension Pattern {
    
    internal func spawn(actionScene: ActionScene, offSet: CGFloat = 0) {
        let point = CGPoint(x: spawnPoint.getPointForNode(sprite).x, y: spawnPoint.getPointForNode(sprite).y + offSet)
        sprite.position = point
        actionScene.worldLayer.addChild(sprite)
    }
    
    func run(hostile: Bool, scene: ActionScene) {
        
    }
    
    func run(hostile: Bool = true, fireDelay: Double = 0, scene: ActionScene) {
        spawn(scene)
        sprite.runAction(behavior.pattern)
        
        if hostile {
            sprite.weapon?.fire(fireDelay)
              print("\(sprite) firing ")
        }
    
    }
    
    init(sprite: BasicEnemy, behavior: Behavior, spawnPoint: SpawnPoint) {
        self.init(sprite: sprite, behavior: behavior, spawnPoint: spawnPoint)
        self.sprite = sprite
        self.behavior = behavior
        self.spawnPoint = spawnPoint
    }
}


struct SimplePattern: Pattern {
    var sprite: BasicEnemy
    var behavior: Behavior
    var spawnPoint: SpawnPoint
    
}

struct FollowerPattern: Pattern {
    var sprite: BasicEnemy
    var behavior: Behavior
    var spawnPoint: SpawnPoint
    
    func run(hostile: Bool = true, fireDelay: Double = 0, scene: ActionScene) {
        spawn(scene)
        sprite.runAction(behavior.pattern, withKey: "moveIn")
        
        var array = scene.pattern?.spritesNeedUpdate
        array?.append(sprite)
        
        if hostile {
            sprite.weapon?.fire(fireDelay)
          
        }
        
    }
}

struct MinePattern: Pattern {
    var sprite: BasicEnemy
    var behavior: Behavior
    var spawnPoint: SpawnPoint
    
    func run(hostile: Bool, scene: ActionScene) {
        spawn(scene)
        sprite.runAction(behavior.pattern)
        sprite.physicsBody?.dynamic = true
        sprite.physicsBody?.applyTorque(0.12)
        
        let randomVector = CGVector(dx: 0, dy: RandomNumbers.getRandomTo10WithNeg())
        sprite.physicsBody?.applyImpulse(randomVector)
        
    }
}

/*

enum MinionApproach {
    case Bottom
    case MidBottom
    case Middle
    case MidTop
    case Top
    
    var pattern: Pattern {
        switch self {
        case .Bottom: return SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.Bottom)
        case .MidBottom: return SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.MidBottom)
        case .Middle: return SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.Middle)
        case .MidTop: return SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.MidTop)
        case .Top: return SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.Top)
        }
    }
    
}

struct PrefabPattern: Pattern {
    
    var sprite: BasicEnemy
    var behavior: Behavior
    var spawnPoint: SpawnPoint
   // var scene: SKScene
    
    static let minionApproachMid = SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.Middle)
    static let minionApproachBottom = SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.Bottom)
    static let minionApproachTop = SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.Top)
    static let minionApproachMidBottom = SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.MidBottom)
    static let minionApproachMidTop = SimplePattern(sprite: Minion(), behavior: Approach(), spawnPoint: SpawnPoint.MidTop)
    
}

let patternw = MinionApproach.Bottom.pattern

*/
    