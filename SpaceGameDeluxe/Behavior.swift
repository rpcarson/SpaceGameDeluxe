//
//  Behavior.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/31/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit



enum BehaviorType {
    case approach
    case approachAndSlow
    
    
//    func behavior<T: Behavior>() -> T {
//        switch self {
//        case .approach: return Approach()
//        case .approachAndSlow: return ApproachAndSlow()
//        }
//    }
}


protocol Behavior {
    var pattern: SKAction { get }
}

extension Behavior {
    var screenWidth: CGFloat {
      return UIScreen.mainScreen().bounds.width
    }
    
}



struct Approach: Behavior {
    var duration: Double
    var pattern: SKAction {
        return moveRightToLeft()
    }
    
    func moveRightToLeft() -> SKAction {
        let despawn = SKAction.removeFromParent()
        let move = SKAction.moveToX(-screenWidth/2, duration: duration)
        let sequence = SKAction.sequence([move, despawn])
        return sequence
    }
    
    init(duration: Double) {
        self.duration = duration
    }
    
    init() {
        self.duration = 0
    }
    
    mutating func lazyInit(duration: Double) {
        self.duration = duration
    }
}

//TODO: solution for decreasing speed without affecting duration of move ~


struct ApproachAndSlow: Behavior {
    var delay: Double = 0
    var pattern: SKAction {
        return enterAndSlow()
    }
    
    func enterAndSlow() -> SKAction {
    
        let despawn = SKAction.removeFromParent()
        let move = SKAction.moveToX(-screenWidth/2, duration: 4)
     //   let moveIn = SKAction.moveToX(screenWidth*0.75, duration: 1)
        let decreaseSpeed = SKAction.speedBy(0.2, duration: 0.8)
       // let group1 = SKAction.group([moveIn, decreaseSpeed])
        let group = SKAction.group([decreaseSpeed, move])
        let wait = SKAction.waitForDuration(delay)
        
        return SKAction.sequence([wait,group, despawn])
        
    }
    
    init(delay: Double) {
        self.delay = delay
      
    }
    
    init() { }
    
    mutating func config(delay: Double) {
        self.delay = delay
    }
    
}

struct MoveInAndFollowPlayer: Behavior {
    var pattern: SKAction {
      return moveIn()
    }

    func moveIn() -> SKAction {
        let move = SKAction.moveToX(screenWidth*0.75, duration: 2)
        let decreaseSpeed = SKAction.speedBy(0, duration: 2)
        let group = SKAction.group([decreaseSpeed, move])
        return group
    }
    
}



struct DiveBomb: Behavior {
    
    var pattern: SKAction {
        return SKAction.waitForDuration(1)
    }
}







/*
protocol EnemyBehavior {
    var node: SKSpriteNode { get set }
    var scene: SKScene { get set }
    var pattern: SKAction { get }
    var spawnPoint: CGPoint { get set }
    func run()
    func spawnNode()
}

extension EnemyBehavior {
    var nodeX: CGFloat {
        return node.position.x
    }
    var nodeY: CGFloat {
        return node.position.y
    }
    var nodeWidth: CGFloat {
        return node.size.width
    }
    var nodeHeight: CGFloat {
        return node.size.height
    }
    var sceneWidth: CGFloat {
        return scene.size.width
    }
    var sceneHeight: CGFloat {
        return scene.size.height
    }
}

extension EnemyBehavior {
    
    func run() {
        spawnNode()
        node.runAction(pattern)
    }
    
    internal func spawnNode() {
        node.position = spawnPoint
        (scene as! ActionScene).actorLayer.addChild(node)
    }
}




struct BasicApproach: EnemyBehavior {
    
    var node: SKSpriteNode
    var scene: SKScene
    var spawnPoint: CGPoint
    
    var point: CGPoint {
        return CGPoint(x: nodeHeight, y: nodeHeight)
    }
    
//    internal func moveRightToLeft(node: SKSpriteNode) -> SKAction {
//        
//        let destination = CGPoint(x: -node.size.width, y: nodeY)
//        
//        let despawn = SKAction.removeFromParent()
//        let move = SKAction.moveTo(destination, duration: 5)
//        let sequence = SKAction.sequence([move, despawn])
//        
//        return sequence
//    }
    
   internal func moveRightToLeft() -> SKAction {
        
        let destination = CGPoint(x: -nodeWidth, y: nodeY)
        
        let despawn = SKAction.removeFromParent()
        let move = SKAction.moveTo(destination, duration: 5)
        let sequence = SKAction.sequence([move, despawn])
        
        return sequence
    }
    
    internal var pattern: SKAction {
       return moveRightToLeft()
    }
    
    init(node: SKSpriteNode, scene: SKScene, spawnPoint: CGPoint) {
        self.node = node
        self.scene = scene
        self.spawnPoint = spawnPoint
    }
    
}


*/


