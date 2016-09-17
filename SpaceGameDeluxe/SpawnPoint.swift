//
//  SpawnPoint.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/31/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


enum SpawnPoint: Int {
    case bottom
    case midBottom
    case middle
    case midTop
    case top
    case topMinus20
    case bottomPlus20
    case randomStrict
    case oneTenth
    case twoTenths
    case threeTenths
    case fourTenths
    case sixTenths
    case sevenTenths
    case eightTenths
    case nineTenths
    case topScreen
    case bottomScreen
    
    var screen: CGRect {
        return UIScreen.main.bounds
    }
    
    func getPointForNode(_ node: SKSpriteNode) -> CGPoint {
        
        var offscreenRight: CGFloat {
            return screen.width + node.size.width
        }
        
        var offsetY: CGFloat {
            return node.size.height/2 + 5
        }
        
        var point: CGPoint {
            switch self {
            case .bottom: return
                CGPoint(x: offscreenRight, y: offsetY)
            case .midBottom: return
                CGPoint(x: offscreenRight, y: screen.height * 0.25 + offsetY/2)
            case .middle: return
                CGPoint(x: offscreenRight, y: screen.height/2)
            case .midTop: return
                CGPoint(x: offscreenRight, y: screen.height * 0.75 - offsetY/2)
            case .top: return
                CGPoint(x: offscreenRight, y: screen.height - offsetY)
            case .topMinus20: return
                CGPoint(x: offscreenRight, y: screen.height - offsetY - 20)
            case .bottomPlus20: return
                CGPoint(x: offscreenRight, y: offsetY + 20)
            case .randomStrict: return
                SpawnPoint(rawValue: RandomNumbers.randomSpawnPoint())!.getPointForNode(node)
                
                
            case .oneTenth: return
                 CGPoint(x: offscreenRight, y: screen.height * 0.1)
            case .twoTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.2)
            case .threeTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.3)
            case .fourTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.4)
            case .sixTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.6)
            case .sevenTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.7)
            case .eightTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.8)
            case .nineTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.9)
                
                
            case .topScreen: return
                CGPoint(x: screen.width * 0.75, y: screen.height + node.size.height)
            case .bottomScreen: return
                CGPoint(x: screen.width * 0.75, y: -screen.height - node.size.height)
                
                
                

                
            }
        }
        return point
    }
    
}
