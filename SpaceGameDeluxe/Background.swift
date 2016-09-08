//
//  Background.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 9/4/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

enum BackgroundType {
    case debris
    case background
}


struct Scroller {
    
    var images: [SKSpriteNode] = []
    
    var scene: ActionScene
    
    var scrollSpeed: CGFloat
    var type: BackgroundType
    
    func setup() {
        for (index, image) in images.enumerate() {
            image.anchorPoint = CGPointZero
            if index > 0 {
                image.position = CGPoint(x: images[index.predecessor()].size.width - 1, y: 0)
            } else if index == 0 {
                image.position = CGPoint(x: 0, y: 0)
            }
            switch type {
            case .debris: image.zPosition = 15
            case .background: image.zPosition = ZPosition.Background.rawValue

            }
            scene.backgroundLayer.addChild(image)
        }
        
        
    }
    
    
    mutating func scroll() {
        
        for image in images {
            image.position = CGPoint(x: image.position.x - scrollSpeed, y: image.position.y)
            
            if image.position.x < -image.size.width {
                
                print("(func scroll) image < -image.width")
                
                let lastInLine = images.count - 1
                
                image.position = CGPoint(x: images[lastInLine].position.x + image.size.width, y: images[lastInLine].position.y)
            
            }
            
        }

    }
    
   
    init(scene: ActionScene, speed: CGFloat, type: BackgroundType) {
        self.scene = scene
        self.scrollSpeed = speed
        self.type = type
    }
    
    
}