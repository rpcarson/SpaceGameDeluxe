//
//  Types.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/13/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit






struct BasicEnemy: EnemyType {
    
    var health: Int = 100
    var maxHealth: Int = 100
    
    func move(inScene: SKScene, toPoint: CGPoint) {
        // unknown
    }
    func attack(withWeapon: WeaponType) {
        //unknown
    }
    func destruct() {
        //unknown
    }
    func decreaseHealth(byAmount: Double) {
        //unknown
    }
}




