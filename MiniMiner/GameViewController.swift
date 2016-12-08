//
//  GameViewController.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/18/16.
//  Copyright (c) 2016 Pixelaborate. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Game(view: self.view)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
