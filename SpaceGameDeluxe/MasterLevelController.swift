//
//  MasterLevelController.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 9/12/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

protocol ScrollingBackground {
    var mainBackground: Scroller? { get set }
    var secondaryBackground: Scroller? { get set }
    var tertiaryBackground: Scroller? { get set }
    
    mutating func scroll()
}

protocol ScrollerImageArray {
    var images: [SKSpriteNode] { get }
}


struct BasicBackground: ScrollerImageArray {

    var bgMain: SKSpriteNode {
        let node = SKSpriteNode(imageNamed: "bgspace")
        node.size.height = UIScreen.main.bounds.height
        node.size.width = UIScreen.main.bounds.width
        return node
    }
    var bgMain1: SKSpriteNode {
        let node = SKSpriteNode(imageNamed: "bgspace")
        node.size.height = UIScreen.main.bounds.height
        node.size.width = UIScreen.main.bounds.width
        return node
    }
    
    var images: [SKSpriteNode] {
        return [bgMain, bgMain1]
    }
}

struct BasiDebris: ScrollerImageArray {
    
    var bgMain: SKSpriteNode {
        let node = SKSpriteNode(imageNamed: "starOverlay")
        node.size.height = UIScreen.main.bounds.height
        node.size.width = UIScreen.main.bounds.width
        return node
    }
    var bgMain1: SKSpriteNode {
        let node = SKSpriteNode(imageNamed: "starOverlay")
        node.size.height = UIScreen.main.bounds.height
        node.size.width = UIScreen.main.bounds.width
        return node
    }
    
    var images: [SKSpriteNode] {
        return [bgMain1, bgMain]
    }
}

struct TestBackground: ScrollingBackground {
    
    let scene: ActionScene

    let background = BasicBackground()
    let debris = BasiDebris()

    var scrollingBackgroundArray: [SKSpriteNode] {
        return background.images
    }
    var debrisOverlay: [SKSpriteNode] {
        return debris.images
    }
//    var scrollingBackgroundArray: [SKSpriteNode] = [
//       SKSpriteNode(imageNamed: "bgspace"), SKSpriteNode(imageNamed: "bgspace")
//    ]
//    
    var mainBackground: Scroller?
    var secondaryBackground: Scroller?
    var tertiaryBackground: Scroller?
    
    mutating func scroll() {
        mainBackground?.scroll()
        if var secondary = secondaryBackground {
            secondary.scroll()
        }
        if var tertiary = tertiaryBackground {
            tertiary.scroll()
        }
    }
    
    init(scene: ActionScene) {
        self.scene = scene
       // scrollingBackgroundArray = [bgMain, bgMain1]
        mainBackground = Scroller(scene: scene, speed: 1, type: .background, imageArray: scrollingBackgroundArray)
        secondaryBackground = Scroller(scene: scene, speed: 6, type: .debris, imageArray: debrisOverlay)
    }
}


protocol MasterLevelController {
    
    var background: ScrollingBackground { get set }
    
    var pattern: ScenePattern { get set }
    
}

struct TestLevel: MasterLevelController {
    var scene: ActionScene
    var background: ScrollingBackground
    var pattern: ScenePattern
    
    init(scene: ActionScene) {
        self.scene = scene
        background = TestBackground(scene: scene)
        pattern = ScenePatternOne(scene: scene)
    }
    
}


