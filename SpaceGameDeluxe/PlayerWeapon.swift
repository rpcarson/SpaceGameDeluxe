//
//  PlayerWeapon.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/7/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

struct PlayerWeaponDamage {
    static let baseGun = 2.0
}

struct BasePlayerGun: PlayerWeapon {
    var damage: Double = PlayerWeaponDamage.baseGun
    var rateOfFire: Double = 0.3
    
    var projectile: Projectile = BasicBullet()
    var owner: Player
    var tracking: Bool = false
    
    init(owner: Player) {
        self.owner = owner
    }
    
    init(owner: Player, pattern: FiringPattern, type: WeaponType, projectile: Projectile, tracking: Bool) {
        self.owner = owner
        self.projectile = projectile
        self.tracking = tracking
        
    }
    
}
