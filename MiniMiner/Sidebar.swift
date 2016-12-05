//
//  Sidebar.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class Sidebar: SKNode{
    let sidebar: SKSpriteNode
    var itemLabels: [SKLabelNode]
    
    init(inventory: Inventory)
    {
        sidebar = SKSpriteNode(imageNamed: "Sidebar")
        sidebar.anchorPoint = CGPoint(x: 0, y: 0)
        sidebar.zPosition = -20
        
        itemLabels = [SKLabelNode]()
        
        for collectedMineables in inventory.collectedMineables{
            itemLabels.append(SKLabelNode(text: collectedMineables.name))
        }
        
        var itemLabelPosition = CGPoint(x: 120, y: 0)
        for itemLabel in itemLabels{
            itemLabel.position = itemLabelPosition
            itemLabelPosition.y += 60
            
            itemLabel.fontName = "Arial Black"
            itemLabel.fontSize = 60
        }
        
        super.init()
    
        position = CGPoint(x: 960, y: 0)
        
        addChild(sidebar)
        for itemLabel in itemLabels{
            addChild(itemLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}