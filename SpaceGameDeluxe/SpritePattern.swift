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
    
    func spawn(_ actionScene: ActionScene, offSet: CGFloat)
    func run(_ hostile: Bool, scene: ActionScene)
    init(sprite: BasicEnemy, behavior: Behavior, spawnPoint: SpawnPoint)
}

extension Pattern {
    
    internal func spawn(_ actionScene: ActionScene, offSet: CGFloat = 0) {
        let point = CGPoint(x: spawnPoint.getPointForNode(sprite).x, y: spawnPoint.getPointForNode(sprite).y + offSet)
        sprite.position = point
        actionScene.worldLayer.addChild(sprite)
    }
    
    func run(_ hostile: Bool, scene: ActionScene) {
        
    }
    
    func run(_ hostile: Bool = true, fireDelay: Double = 0, scene: ActionScene) {
        spawn(scene)
        sprite.run(behavior.pattern)
        
        if hostile {
            sprite.weapon?.fire(fireDelay)
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
    
    func run(_ hostile: Bool = true, fireDelay: Double = 0, scene: ActionScene) {
        spawn(scene)
        sprite.run(behavior.pattern, withKey: "moveIn")
        
        var array = scene.masterLevelController?.pattern.spritesNeedUpdate
        array?.append(sprite)
        print("run with key moveIn")
        
        if hostile {
            sprite.weapon?.fire(fireDelay)
            
        }
        
    }
}

struct MinePattern: Pattern {
    var sprite: BasicEnemy
    var behavior: Behavior
    var spawnPoint: SpawnPoint
    
    func run(_ hostile: Bool, scene: ActionScene, offset: CGFloat) {
        spawn(scene, offSet: offset)
        sprite.run(behavior.pattern)
        sprite.physicsBody?.isDynamic = true
        sprite.physicsBody?.applyTorque(0.12)
        
        let randomVector = CGVector(dx: 0, dy: RandomNumbers.getRandomTo10WithNeg())
        sprite.physicsBody?.applyImpulse(randomVector)
        
    }
}


struct EvasivePattern: Pattern {
    var sprite: BasicEnemy
    var behavior: Behavior
    var spawnPoint: SpawnPoint
    
  
    func run(_ hostile: Bool, fireDelay: Double, scene: ActionScene, speed: Double, toPoint: SpawnPoint, offset: CGFloat, evadeDelay: Bool) {
        
        
        spawn(scene, offSet: offset)
        
        
        guard let enemyScene = sprite.scene else { return  }

        
        let pointY = toPoint.getPointForNode(sprite).y
        let point = CGPoint(x: enemyScene.size.width * 0.5, y: pointY)
        
        let moveIn = SKAction.moveTo(x: enemyScene.size.width * 0.75, duration: speed/4)
        let dodge = SKAction.move(to: point, duration: speed/4)
        let moveOut = SKAction.moveTo(x: -enemyScene.size.width/2, duration: speed)
        let sequence = SKAction.sequence([moveIn,dodge,moveOut])
        
        if evadeDelay {
            sprite.run(sequence)

        } else {
            let newDodge = SKAction.move(to: point, duration: speed/2)
            let newSequence = SKAction.sequence([newDodge, moveOut])
            sprite.run(newSequence)
        }
        
        
        if hostile {
            sprite.weapon?.fire(fireDelay)
        }
        
      
        
     
    }
    
}


struct EvadeLate: Pattern {
    var sprite: BasicEnemy
    var behavior: Behavior
    var spawnPoint: SpawnPoint
    
    func run(_ hostile: Bool, fireDelay: Double, scene: ActionScene, speed: Double, toPoint: SpawnPoint, offset: CGFloat) {
        
        spawn(scene, offSet: offset)
        
        
        guard let enemyScene = sprite.scene else { return  }
        
        let pointY = toPoint.getPointForNode(sprite).y
        
        let moveIn = SKAction.moveTo(x: enemyScene.size.width * 0.5, duration: speed/3)
        let exitPoint = CGPoint(x:-sprite.size.width, y: pointY)
        let evade = SKAction.move(to: exitPoint, duration: speed/3)
        let moveOut = SKAction.moveTo(x: -enemyScene.size.width/2, duration: speed/3)
        
        let sequence = SKAction.sequence([moveIn, evade, moveOut])

        sprite.run(sequence)

        if hostile {
            sprite.weapon?.fire(fireDelay)
        }
        
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
    
