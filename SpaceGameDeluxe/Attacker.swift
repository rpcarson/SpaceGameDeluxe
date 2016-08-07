//
//  Attacker.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


protocol Attacker {
    var weapon: Weapon? { get set }
    var projectileOrigin: CGPoint { get }
    func attack()
}

extension Attacker {
    func attack() {
        print("\(self) is attacking")
    }
}

