//
//  Protocols.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


protocol PlayerType: Destructable, Attacker {
    var shield: ShieldType? { get set }
    var armor: ArmorType? { get set }
    var secondaryWeapon: WeaponType? { get set }
    var superWeapon: WeaponType? { get set }
}











protocol Overheatable: WeaponType {
    
    var maxHeat: Double { get set }
    var cooldownRate: Double { get set }
    var heatupRate: Double { get set }
    var overheatDelay: Double { get set }
    
    func overheat()
    func adjustHeat(_ byAmount: Double)
    
}












//
