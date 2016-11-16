//
//  Textures.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

enum LevelMultiplier: Double {
    case levelOne = 1.0
    case levelTwo = 1.25
}

enum ShieldTextures: String {
    case testShield = "TestShield1"
    
    func getTexture() -> SKTexture {
        switch self {
        case .testShield: return SKTexture(imageNamed: self.rawValue)
        }
    }
}


enum PlayerTextures: String {
    case Player = "betterShittyPlayer"
    
    func getTexture() -> SKTexture {
        switch self {
        case .Player: return SKTexture(imageNamed: PlayerTextures.Player.rawValue)
        }
    }
}

enum WeaponTextures: String {
    case BasicBullet = "gunfire1"
    case GreenBullet = "gunfire2"
    case EnergyBulletPurple = "EnergyBulletPurple"
    case PlaceHolderMissile = "11"
    
//    let missileTex: SKTexture {
//        let tex = SKTexture(imageNamed: "placeholderMissile")
//        tex.size().height = 100
//    }
    
    func getTexture() -> SKTexture {
        switch self {
        case .BasicBullet: return SKTexture(imageNamed: WeaponTextures.BasicBullet.rawValue)
            case .EnergyBulletPurple: return SKTexture(imageNamed: "EnergyBulletPurple")
            case .PlaceHolderMissile: return SKTexture(imageNamed: "placeholderMissile")
        case .GreenBullet: return SKTexture(imageNamed: "gunfire2")
        }
    }
}

enum EnemyTraits {
  
    case basicEnemy
    case minion
    case mine
    case squareJet
    case jet
    
    func getTexture() -> SKTexture {
        switch self {
        case .basicEnemy: return SKTexture(imageNamed: "alien1")
        case .minion: return SKTexture(imageNamed: "stupidAssMinion1")
        case .mine: return SKTexture(imageNamed: "mine1")
        case .squareJet: return SKTexture(imageNamed: "strafeJet")
        case .jet: return SKTexture(imageNamed: "crapEnemy1")
            
        }
    }
    
    func getSize() -> CGSize {
        switch self {
        case .basicEnemy: return CGSize(width: 50, height: 50)
        case .minion: return CGSize(width: 50, height: 50)
        case .mine: return CGSize(width: 50, height: 50)
        case .squareJet: return CGSize(width: 50, height: 50)
        case .jet: return CGSize(width: 50, height: 50)
    }
        
    }
    
    func getProjectileOrigin(_ position: CGPoint) -> CGPoint {
        let x = position.x
        let y = position.y
       // let height = getTexture().size().height
        let width = getTexture().size().width
        //TODO: - COmplete texture offset calclulations
        
        return CGPoint(x: x - width/2, y: y)
    }
    

    
    var healthValue: Double {
        switch self {
        case .basicEnemy: return 100
        case .minion: return 6
        case .mine: return 30
        case .squareJet: return 24
        case .jet: return 12
        }
    }
    
    
    var bounty: Double {
        switch self {
        case .basicEnemy: return 100
        case .minion: return 25
        case .mine: return 10
        case .squareJet: return 100
        case .jet: return 40
        }
    }
    

    
    
}















//
