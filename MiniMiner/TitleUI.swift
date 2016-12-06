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
    let stockButton: SKButton
    
    let uiLayer: SKNode
    
    init()
    {
        let startTexture = SKTexture(imageNamed: "Pickaxe")
        startButton = SKButton(position: CGPoint(x: 640, y: 360), texture: startTexture, size: CGSize(width: 128, height: 128))
        
        let stockTexture = SKTexture(imageNamed: "Hammer")
        stockButton = SKButton(position: CGPoint(x: 800, y: 360), texture: stockTexture, size: CGSize(width: 128, height: 128))
        
        uiLayer = SKNode()
        
        uiLayer.addChild(startButton)
        uiLayer.addChild(stockButton)
    }
    
    func update(game: Game)
    {
        if(startButton.selected)
        {
            game.ChangeScene(UndergroundScene(game), transition: SKTransition.crossFadeWithDuration(0.3))
        }
        
        if(stockButton.selected)
        {
            game.stockManager.setRandomStocks()
        }
    }
    
}