//
//  PlayerWeapon.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/7/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

struct BasePlayerGun: PlayerWeapon {

    
    var damage: Double = 2
    var rateOfFire: Double = RateOfFire.fast
    
   // var firePattern: FiringPattern = BurstThree()
   // var weaponType: WeaponType = BasicChainGun()
    
    //var projectile: Projectile = BasicBullet()
    var projectile: Projectile = BasicBullet()
  //  var owner: SKSpriteNode
    var owner: Player
    var tracking: Bool = false
    
    init(owner: Player) {
        self.owner = owner
       // projectile = BasicBullet(source: self)
    }
    
    init(owner: Player, pattern: FiringPattern, type: WeaponType, projectile: Projectile, tracking: Bool) {
        self.owner = owner
        // self.firePattern = pattern
      //  self.weaponType = type
        self.projectile = projectile
        self.tracking = tracking
        
    }
    
}