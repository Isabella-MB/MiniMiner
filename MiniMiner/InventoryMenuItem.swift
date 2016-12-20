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
    let itemValue: SKLabelNode
    
    init(mineableType: MineableType, numberOfItems: Int)
    {
        itemLabel = SKLabelNode(text: "x " + String(numberOfItems))
        itemLabel.fontSize = 60
        itemLabel.position = CGPoint(x: 190, y: -45)
        itemImage = SKSpriteNode(imageNamed: mineableType.name)
        itemImage.size = CGSize(width: 60, height: 60)
        itemImage.position = CGPoint(x: 130, y: -30)
        
        itemValue = SKLabelNode(text: String(mineableType.value))
        itemValue.position = CGPoint(x: 30, y: -30)
        itemValue.fontSize = 60
        
        super.init()
        
        addChild(itemValue)
        addChild(itemLabel)
        addChild(itemImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIColor{
    static var random: UIColor{
        return UIColor(red: CGFloat(arc4random() / UINT32_MAX), green: CGFloat(arc4random() / UINT32_MAX), blue: CGFloat(arc4random() / UINT32_MAX), alpha: 1)
    }
}
