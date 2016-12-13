//
//  SKScrollMenuItem.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/9/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class InventoryMenuItem : SKNode{
    
    let itemImage: SKSpriteNode
    let itemLabel: SKLabelNode
    let background: SKSpriteNode
    
    init(position: CGPoint, mineableType: MineableType, numberOfItems: Int)
    {
        itemLabel = SKLabelNode(text: "x" + String(numberOfItems))
        itemLabel.fontSize = 60
        itemImage = SKSpriteNode(imageNamed: mineableType.name)
        itemImage.size = CGSize(width: 60, height: 60)
        
        background = SKSpriteNode(texture: SKTexture(), size: CGSize(width: 320, height: 60))
        background.zPosition = -4
        
        super.init()
        
        self.position = position;
        
        addChild(itemLabel)
        addChild(background)
        addChild(itemImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
