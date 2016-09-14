//
//  EnemyWeapon.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/7/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


struct RateOfFire {
    static let fast = 0.20
    static let medium = 0.75
    static let slow = 1.25
}

extension EnemyWeapon {
    
    init(owner: BasicEnemy) {
        self.init(owner: owner)
      // self.owner = owner
    }
    
    init(owner: BasicEnemy, tracking: Bool) {
        self.init(owner: owner)
        self.tracking = tracking
    }
    
    init(owner: BasicEnemy, pattern: EnemyFiringPattern, projectile: Projectile, tracking: Bool) {
       // self.init(owner: owner, pattern: pattern, projectile: projectile, tracking: tracking)
        self.init(owner: owner)
        self.owner = owner
        self.firePattern = pattern
        self.projectile = projectile
        self.tracking = tracking
    }
    
    init(owner: BasicEnemy, pattern: EnemyFiringPattern, tracking: Bool) {
        self.init(owner: owner)
        self.owner = owner
        self.firePattern = pattern
        self.tracking = tracking
    }
}



struct BaseGun: EnemyWeapon {
    var damage: Double = 2
    var rateOfFire: Double = 2
    
    var firePattern: EnemyFiringPattern = Burst(shotsInBurst: 1, burstSpeed: 1, timeBetween: 1)
    var projectile: Projectile = BasicBullet()
    var owner: BasicEnemy = BasicEnemy()
    var tracking: Bool = false
    
    init(owner: BasicEnemy) {
        self.owner = owner
    }

}


struct BasicEnergyGun: EnemyWeapon {
    var damage: Double = 4
    var rateOfFire: Double = 2
    var firePattern: EnemyFiringPattern = Burst(shotsInBurst: 1, burstSpeed: 1, timeBetween: 1)
    var projectile: Projectile = BasicRoundBullet()
    var owner: BasicEnemy
    var tracking: Bool = false

    init(owner: BasicEnemy) {
        self.owner = owner
    }
    
}

struct Autocannon: EnemyWeapon {
    var damage: Double = 1
    var rateOfFire: Double = RateOfFire.fast
    var projectile: Projectile = BasicBullet()
    var owner: BasicEnemy
    var tracking: Bool = false
    
    var firePattern: EnemyFiringPattern = Burst(shotsInBurst: 5, burstSpeed: BurstSpeed.fast.rawValue, timeBetween: 2)
    
    init(owner: BasicEnemy) {
        self.owner = owner
    }
}


