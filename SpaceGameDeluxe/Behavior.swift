//
//  Behavior.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/31/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


protocol Behavior {
    var pattern: SKAction { get }
}

extension Behavior {

}

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
        scene.addChild(node)
    }
}

struct Approach: Behavior {
   let screenWidth = UIScreen.mainScreen().bounds.width

    var pattern: SKAction {
        return moveRightToLeft()
    }
    
    func moveRightToLeft() -> SKAction {
    
        let despawn = SKAction.removeFromParent()
        let move = SKAction.moveToX(-screenWidth/2, duration: 7)
        let sequence = SKAction.sequence([move, despawn])
        
        return sequence
    }
}


struct BasicApproach: EnemyBehavior {
    
    var node: SKSpriteNode
    var scene: SKScene
    var spawnPoint: CGPoint
    
    var point: CGPoint {
        return CGPoint(x: nodeHeight, y: nodeHeight)
    }
    
    internal func moveRightToLeft(node: SKSpriteNode) -> SKAction {
        
        let destination = CGPoint(x: -node.size.width, y: nodeY)
        
        let despawn = SKAction.removeFromParent()
        let move = SKAction.moveTo(destination, duration: 5)
        let sequence = SKAction.sequence([move, despawn])
        
        return sequence
    }
    
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
