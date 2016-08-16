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




protocol ArmorType {
    var maxArmor: Double { get set }
    var armorHealth: Double { get set }
    var mitigationFactor: Double { get set }
}



protocol ShieldType {
    var maxShield: Double { get set }
    var shieldHealth: Int { get set }
    var rechargeRate: Double { get set }
    var rechargeDelay: Double { get set }
    
    func recharge(byAmount: Double)
    
}


protocol Overheatable: WeaponType {
   
    var maxHeat: Double { get set }
    var cooldownRate: Double { get set }
    var heatupRate: Double { get set }
    var overheatDelay: Double { get set }
    
    func overheat()
    func adjustHeat(byAmount: Double)
  
}



protocol EnemyType: Destructable, Attacker {

}










//