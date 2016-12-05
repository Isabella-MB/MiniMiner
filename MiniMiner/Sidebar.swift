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
    let itemMenu: SKVerticalScrollMenu
    
    init(inventory: Inventory)
    {
        sidebar = SKSpriteNode(imageNamed: "Sidebar")
        sidebar.anchorPoint = CGPoint(x: 0, y: 0)
        sidebar.zPosition = -20
        
        var itemLabels = [SKLabelNode]()
        
        for collectedMineables in inventory.collectedMineables{
            itemLabels.append(SKLabelNode(text: collectedMineables.name))
        }
        
        var itemLabelPosition = CGPoint(x: 0, y: -60)
        for itemLabel in itemLabels{
            itemLabel.position = itemLabelPosition
            itemLabelPosition.y -= 60
            
            itemLabel.fontName = "Arial Black"
            itemLabel.fontSize = 60
        }
        
        itemMenu = SKVerticalScrollMenu(position: CGPoint(x: 120, y: 720), size: CGSize(width: 320, height: 400), childNodes: itemLabels)
        
        super.init()
    
        position = CGPoint(x: 960, y: 0)
        
        addChild(sidebar)
        addChild(itemMenu)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}