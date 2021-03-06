//
//  Layers.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/24/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

enum ZPosition: CGFloat {
    case background = -2
    case world = 2
    case hud = 4
    case scrollingBackground = -10
    case scrollingDebris = -9
}

class BackgroundLayer: SKNode {
    
}

class HUDLayer: SKNode {
    
}

class WorldLayer: SKNode {
    
//    override init() {
//        super.init()
//        self.xScale = 0.5
//        self.yScale = 0.5
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

class ActorLayer: SKNode {
    
}

class ProjectileLayer: SKNode {
    
}

class ZoneLayer: SKNode {
    
}

