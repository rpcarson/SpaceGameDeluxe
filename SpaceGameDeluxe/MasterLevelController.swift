//
//  MasterLevelController.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 9/12/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import SpriteKit

protocol ScrollingBackground {
    var mainBackground: Scroller { get set }
    var secondaryBackground: Scroller? { get set }
    var tertiaryBackground: Scroller? { get set }
}

struct TestBackground: ScrollingBackground {
    var mainBackground: Scroller
    var secondaryBackground: Scroller?
    var tertiaryBackground: Scroller?
}


struct MasterLevelController {
    
    let background: ScrollingBackground?
    
    let pattern: ScenePattern
    
}
