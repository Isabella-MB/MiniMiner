//
//  MiningUI.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/2/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class MiningUI
{
    let hammer: SKButton
    let pickaxe: SKButton
    
    let uiLayer: SKNode
    
    init()
    {
        let hammerTexture = SKTexture(imageNamed: "Hammer")
        hammer = SKButton(position: CGPoint(x: 1100, y: 100), texture: hammerTexture, size: CGSize(width: 128, height: 128))
        
        let pickaxeTexture = SKTexture(imageNamed: "Pickaxe")
        pickaxe = SKButton(position: CGPoint(x: 1100, y: 400), texture: pickaxeTexture, size: CGSize(width: 128, height: 128))
        
        uiLayer = SKNode()
        
        uiLayer.addChild(hammer)
        uiLayer.addChild(pickaxe)
    }
    
    func update()
    {
        if(hammer.selected)
        {
            miningMode = MiningMode.hammer
        }
        
        else if(pickaxe.selected)
        {
            miningMode = MiningMode.pickaxe
        }
    }
}