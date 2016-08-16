//
//  WeaponType.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

protocol WeaponType {
    var damage: Double { get set }
    var rateOfFire: Double { get set }
    
    func fire()
}

extension WeaponType {
    init(owner: SKSpriteNode) {
        self.init(owner: owner)
    }
}


struct BasicChainGun: WeaponType {
    var damage: Double = 1
    var rateOfFire: Double = RateOfFire.fast
    
    func fire() {
        
    }
    
}







