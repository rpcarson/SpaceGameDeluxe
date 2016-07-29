//
//  Extensions.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit


extension SKNode {
    func remove() {
        self.physicsBody = nil
        self.removeAllActions()
        self.removeFromParent()
    }
}