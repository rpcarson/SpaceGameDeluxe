//
//  Textures.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


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
    
    func getTexture() -> SKTexture {
        switch self {
        case .BasicBullet: return SKTexture(imageNamed: WeaponTextures.BasicBullet.rawValue)
        }
    }
}

enum EnemyTextures {
  
    case BasicEnemy
    case Minion
    case Mine
    case SquareJet
    case Jet
    
    func getTexture() -> SKTexture {
        switch self {
        case .BasicEnemy: return SKTexture(imageNamed: "alien1")
        case .Minion: return SKTexture(imageNamed: "stupidAssMinion1")
        case .Mine: return SKTexture(imageNamed: "mine1")
        case .SquareJet: return SKTexture(imageNamed: "strafeJet")
        case .Jet: return SKTexture(imageNamed: "crapEnemy1")
            
        }
    }
    
    func getSize() -> CGSize {
        switch self {
        case .BasicEnemy: return CGSize(width: 50, height: 50)
        case .Minion: return CGSize(width: 50, height: 50)
        case .Mine: return CGSize(width: 50, height: 50)
        case .SquareJet: return CGSize(width: 50, height: 50)
        case .Jet: return CGSize(width: 50, height: 50)
    }
        
    }
    
    func getProjectileOrigin(position: CGPoint) -> CGPoint {
        let x = position.x
        let y = position.y
       // let height = getTexture().size().height
        let width = getTexture().size().width
        //TODO: - COmplete texture offset calclulations
        
        return CGPoint(x: x - width/2, y: y)
    }
    
    var healthValue: Double {
        switch self {
        case .BasicEnemy: return 100
        case .Minion: return 10
        case .Mine: return 20
        case .SquareJet: return 10
        case .Jet: return 40
        }
    }
    
    var weapon: EnemyWeapon {
        switch self {
        case .BasicEnemy: return BaseGun()
        case .Minion: return BaseGun()
        case .Mine: return BaseGun()
        case .SquareJet: return BaseGun()
        case .Jet: return BaseGun()
        }
    }
    
    
}















//