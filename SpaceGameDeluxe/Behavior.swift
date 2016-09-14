//
//  Behavior.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/31/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


//TODO: Make specific follower behavior

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
    var screenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.height
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
    
}

//TODO: solution for decreasing speed without affecting duration of move ~


struct ApproachAndSlow: Behavior {
    var delay: Double = 0
    var pattern: SKAction {
        return enterAndSlow()
    }
    
    func enterAndSlow() -> SKAction {
    
        let despawn = SKAction.removeFromParent()
        let move = SKAction.moveToX(-screenWidth/2, duration: 5)
      //  let moveIn = SKAction.moveToX(screenWidth*0.75, duration: 2)
        let decreaseSpeed = SKAction.speedBy(0.2, duration: 0.5)
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
        print("MoveIn func")
        return group
    }
    
}

// only use with Top/Bottom Screen spawnPoints

struct EnterFromTopOrBottomFollow: Behavior {
    
    var pattern: SKAction {
        return enter()
    }
    
    func enter() -> SKAction {
        let move =  SKAction.moveToY(screenHeight*0.5, duration: 3)
        let decreaseSpeed = SKAction.speedBy(0, duration: 2)
        let group = SKAction.group([decreaseSpeed, move])
        return group
        //return move
    }
    
}

//// ^^^^^^^^

struct DiveBomb: Behavior {
    
    var pattern: SKAction {
        return SKAction.waitForDuration(1)
    }
}


enum DodgeDirection {
    case Up
    case Down
}

/*
struct BasicEvasive: Behavior {
    
    var duration: Double
    var direction: DodgeDirection
    var nodePosition: CGPoint
    
    var pattern: SKAction {
        return SKAction.waitForDuration(0)
    }
    
    
    func move() -> SKAction {
        
        var dodgePoint: CGPoint {
            switch direction {
            case .Up: return CGPoint(x: screenWidth*0.5, y: nodePosition.y + screenHeight * 0.25)
            case .Down: return CGPoint(x: screenWidth*0.5, y: nodePosition.y - screenHeight * 0.25)
            }
        }
        
        let moveIn = SKAction.moveToX(screenWidth*0.75, duration: duration/4)
        let dodge = SKAction.moveTo(dodgePoint, duration: duration/4)
        let moveOut = SKAction.moveToX(-screenWidth/2, duration: duration/2)

    }
    
    
    init(duration: Double, direction: DodgeDirection) {
        self.duration = duration
        self.direction = direction
    }
    
    init() {
        self.duration = 0
    }

}
*/





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


