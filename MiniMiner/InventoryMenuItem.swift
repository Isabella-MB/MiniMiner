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
        itemLabel.position = CGPoint(x: 45, y: -45)
        itemImage = SKSpriteNode(imageNamed: mineableType.name)
        itemImage.size = CGSize(width: 60, height: 60)
        itemImage.position = CGPoint(x: 0, y: -30)
        
        super.init()
        
        addChild(itemLabel)
        addChild(itemImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
