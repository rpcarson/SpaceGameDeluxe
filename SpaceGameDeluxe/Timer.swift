//
//  Timer.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/20/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation


class Timer {
   
    let sharedInstance = Timer()
    
    let timer = NSTimer()
    
    
}

class WeaponTimer {
    
     let timer = NSTimer(timeInterval: Player.sharedInstance.weapon!.rateOfFire, target: Player.sharedInstance, selector: #selector(Player.sharedInstance.firePrimary), userInfo: nil, repeats: true)
    
    
}


class SpawnTimer {
   
    
    
    
}

