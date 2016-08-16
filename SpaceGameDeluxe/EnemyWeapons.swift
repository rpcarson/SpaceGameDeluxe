//
//  EnemyWeapon.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/7/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit



struct BaseGun: EnemyWeapon {
    
    var firePattern: FiringPattern = BurstThree()
    var weaponType: WeaponType = BasicChainGun()
    var projectile: Projectile = BasicBullet()
    
    var owner: SKSpriteNode = BasicEnemy()
    var tracking: Bool = false
    
    init(owner: SKSpriteNode) {
        self.owner = owner
    }
    
    init() {
        
    }

    
    init(owner: BasicEnemy, pattern: FiringPattern, type: WeaponType, projectile: Projectile, tracking: Bool) {
        self.owner = owner
        self.firePattern = pattern
        self.weaponType = type
        self.projectile = projectile
        self.tracking = tracking
        
    }
    
}
