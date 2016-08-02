//
//  SpawnPoint.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/31/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


enum SpawnPoint {
    case Bottom
    case MidBottom
    case Middle
    case MidTop
    case Top
    
    var screen: CGRect {
        return UIScreen.mainScreen().bounds
    }
    
    func getPointForNode(node: SKSpriteNode) -> CGPoint {
        
        var offscreenRight: CGFloat {
            return screen.width + node.size.width
        }
        
        var offsetY: CGFloat {
            return node.size.height/2 + 5
        }
        
        var point: CGPoint {
            switch self {
            case .Bottom: return
                CGPoint(x: offscreenRight, y: offsetY)
            case .MidBottom: return
                CGPoint(x: offscreenRight, y: screen.height * 0.25 + offsetY/2)
            case .Middle: return
                CGPoint(x: offscreenRight, y: screen.height/2)
            case .MidTop: return
                CGPoint(x: offscreenRight, y: screen.height * 0.75 - offsetY/2)
            case .Top: return
                CGPoint(x: offscreenRight, y: screen.height - offsetY)
                
            }
        }
        return point
    }
    
}
