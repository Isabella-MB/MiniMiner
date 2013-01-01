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
        
        var menuItems = [InventoryMenuItem]()
        
        var itemCounts = [Int](repeating: 0, count: MineableType.count)
        
        for item in inventory.collectedMineables{
            itemCounts[item.rawValue] += 1
        }
        
        for i in 0..<MineableType.count{
            itemCounts.append(0)
        }
        
        var itemLabelPosition = CGPoint(x: 0, y: -60)
        for menuItem in menuItems{
            menuItem.position = itemLabelPosition
            itemLabelPosition.y -= 60
            
        }
        
        itemMenu = SKVerticalScrollMenu(position: CGPoint(x: 120, y: 600), size: CGSize(width: 320, height: 200), childNodes: menuItems)
        
        super.init()
    
        position = CGPoint(x: 960, y: 0)
        
        addChild(sidebar)
        addChild(itemMenu)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
