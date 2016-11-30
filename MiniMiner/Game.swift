//
//  Game.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/28/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class Game{
    
    let skView : SKView
    
    var currentScene : SKScene!
    var previousScene : SKScene!
    
    init(view : UIView)
    {
        skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.multipleTouchEnabled = false;
        
        ChangeScene(TitleScene(self))
    }
    
    func ChangeScene(newScene : SKScene)
    {
        previousScene = currentScene
        currentScene = newScene
        skView.presentScene(currentScene)
    }
    
    func ToPreviousScene()
    {
        let temp = currentScene
        currentScene = previousScene
        skView.presentScene(currentScene)
        previousScene = temp
    }
}