//
//  Protocols.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/17/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


struct MaskValue {
    struct Collision {
        static let player: UInt32 = 0
        static let projectile: UInt32 = 1
        static let enemy: UInt32 = 2
        static let scene: UInt32 = 3
    }
    struct Category {
        
    }
    static let player: UInt32 = 0
    static let projectile: UInt32 = 1
    static let enemy: UInt32 = 2
    static let scene: UInt32 = 3
    static let destructable: UInt32 = 4

  
}


protocol PlayerType: DestructableType, AttackType {
    var shield: ShieldType? { get set }
    var armor: ArmorType? { get set }
    var primaryWeapon: WeaponType { get set }
    var secondaryWeapon: WeaponType? { get set }
    var superWeapon: WeaponType? { get set }
}

protocol Textured {
    var imageAsset: SKTexture { get set }
}

protocol AttackType {
    func attack(withWeapon: WeaponType)
}


protocol ArmorType {
    var maxArmor: Double { get set }
    var armorHealth: Double { get set }
    var mitigationFactor: Double { get set }
}

protocol DestructableType {
    var maxHealth: Double { get set }
    var health: Double { get set }
    
    func decreaseHealth(amount: Double)
    func destruct()
}

protocol ShieldType {
    var maxShield: Double { get set }
    var shieldHealth: Int { get set }
    var rechargeRate: Double { get set }
    var rechargeDelay: Double { get set }
    
    func recharge(byAmount: Double)
    
}

protocol WeaponType {
    
    var damage: Double { get set }
    var rateOfFire: Double { get set }
    var ammoCount: Int { get set }
    
    var projectile: AnyObject { get }
    var body: SKPhysicsBody { get }
    
    func fire(inScene: SKScene)

    
}

protocol Overheatable: WeaponType {
    var maxHeat: Double { get set }
    var cooldownRate: Double { get set }
    var heatupRate: Double { get set }
    var overheatDelay: Double { get set }
    
    func overheat()
    func increaseHeat(byAmount: Double)
    func decreaseHeat(byAmount: Double)
}


protocol Spawnable {
    static func spawn(inScene scene: SKScene)

}

protocol EnemyType: DestructableType, AttackType, Spawnable { }










//