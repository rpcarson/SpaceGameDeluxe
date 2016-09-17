//
//  GameViewController.swift
//  SpaceGameDeluxe
//
//  Created by Reed Carson on 7/13/16.
//  Copyright (c) 2016 Reed Carson. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size: view.bounds.size)
        
            let skView = self.view as! SKView
            
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.showsPhysics = true
            skView.frameInterval = 2
            skView.shouldCullNonVisibleNodes = false
        
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
        
            
            skView.presentScene(scene)
      
    }

    override var shouldAutorotate : Bool {
        return false
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
