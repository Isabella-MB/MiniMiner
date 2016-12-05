//
//  TitleUI.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class TitleUI{
    let startButton: SKButton
    
    let uiLayer: SKNode
    
    init()
    {
        let hammerTexture = SKTexture(imageNamed: "Pickaxe")
        startButton = SKButton(position: CGPoint(x: 640, y: 360), texture: hammerTexture, size: CGSize(width: 128, height: 128))
        
        uiLayer = SKNode()
        
        uiLayer.addChild(startButton)
    }
    
    func update(game: Game)
    {
        if(startButton.selected)
        {
            game.ChangeScene(UndergroundScene(game), transition: SKTransition.crossFadeWithDuration(3))
        }
    }
    
}