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
    
    init(mineableType: MineableType, numberOfItems: Int)
    {
        itemLabel = SKLabelNode(text: "x" + String(numberOfItems))
        itemLabel.fontSize = 60
        itemImage = SKSpriteNode(imageNamed: mineableType.name)
        
        super.init()
        
        addChild(itemLabel)
        addChild(itemImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
