//
//  Attacker.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 8/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation


protocol Attacker {
    var weapon: WeaponType? { get set }
    func attack()
}

extension Attacker {
    func attack() {
        weapon?.fire()
        print("\(self) is attacking")
    }
}