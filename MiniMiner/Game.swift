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
    let stockManager: StockManager
    
    var currentScene : SKScene!
    var previousScene : SKScene!
    
    init(view : UIView)
    {
        skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.isMultipleTouchEnabled = false;
        
        inventory = Inventory()
        stockManager = StockManager()
        
        stockManager.loadStocks()
        
        ChangeScene(TitleScene(self), transition: SKTransition.push(with: .left, duration: 0.4))
    }
    
    func ChangeScene(_ newScene : SKScene, transition: SKTransition)
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
