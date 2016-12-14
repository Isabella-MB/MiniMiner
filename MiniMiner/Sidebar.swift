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
        
        for i in 0..<MineableType.count{
            
            let mineable = MineableType(rawValue: i)!
            
            if(inventory.collectedMineables[mineable]! > 0){
                menuItems.append(InventoryMenuItem(mineableType: mineable, numberOfItems: inventory.collectedMineables[mineable]!))
            }
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
