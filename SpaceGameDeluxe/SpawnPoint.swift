//
//  SpawnPoint.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/31/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


enum SpawnPoint: Int {
    case Bottom
    case MidBottom
    case Middle
    case MidTop
    case Top
    case TopMinus20
    case BottomPlus20
    case RandomStrict
    case OneTenth
    case TwoTenths
    case ThreeTenths
    case FourTenths
    case SixTenths
    case SevenTenths
    case EightTenths
    case NineTenths
    
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
            case TopMinus20: return
                CGPoint(x: offscreenRight, y: screen.height - offsetY - 20)
            case BottomPlus20: return
                CGPoint(x: offscreenRight, y: offsetY + 20)
            case .RandomStrict: return
                SpawnPoint(rawValue: RandomNumbers.randomSpawnPoint())!.getPointForNode(node)
                
                
            case .OneTenth: return
                 CGPoint(x: offscreenRight, y: screen.height * 0.1)
            case .TwoTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.2)
            case .ThreeTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.3)
            case .FourTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.4)
            case .SixTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.6)
            case .SevenTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.7)
            case .EightTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.8)
            case .NineTenths: return
                CGPoint(x: offscreenRight, y: screen.height * 0.9)
                
                

                
            }
        }
        return point
    }
    
}
