//
//  Game.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/28/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

let tileWidth: CGFloat = 60.0
let tileHeight: CGFloat = 60.0

enum MiningMode{
    case pickaxe, hammer
}

var miningMode = MiningMode.pickaxe

class Game{
    
    let skView : SKView
    let inventory : Inventory
    
    var currentScene : SKScene!
    var previousScene : SKScene!
    
    init(view : UIView)
    {
        skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.multipleTouchEnabled = false;
        
        inventory = Inventory()
        
        ChangeScene(TitleScene(self), transition: SKTransition.pushWithDirection(.Left, duration: 0.4))
    }
    
    func ChangeScene(newScene : SKScene, transition: SKTransition)
    {
        previousScene = currentScene
        currentScene = newScene
        skView.presentScene(currentScene, transition: transition)
    }
    
    func ToPreviousScene()
    {
        let temp = currentScene
        currentScene = previousScene
        skView.presentScene(currentScene)
        previousScene = temp
    }
}