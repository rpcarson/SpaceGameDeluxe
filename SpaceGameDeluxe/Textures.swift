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

enum EnemyTextures: String {
    case BasicEnemy = "alien1"
    case Minion = "stupidAssMinion1"
    case Mine = "mine1"
    case SquareJet = "strafeJet"
    case Jet = "crapEnemy1"
    
    func getTexture() -> SKTexture {
        switch self {
        case .BasicEnemy: return SKTexture(imageNamed: EnemyTextures.BasicEnemy.rawValue)
        case .Minion: return SKTexture(imageNamed: EnemyTextures.Minion.rawValue)
        case .Mine: return SKTexture(imageNamed: EnemyTextures.Mine.rawValue)
        case .SquareJet: return SKTexture(imageNamed: EnemyTextures.SquareJet.rawValue)
        case .Jet: return SKTexture(imageNamed: EnemyTextures.Jet.rawValue)
            
        }
    }
}