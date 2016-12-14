//
//  Mineables.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/1/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class Mineable: SKSpriteNode {
    
    var mineableType: MineableType;
    var coordinates: CGPoint;
    var manager: StockManager;
    
    var revealed = false;
    
    init(position: CGPoint, mineableType: MineableType)
    {
        self.mineableType = mineableType
        
        let texture = SKTexture(imageNamed: mineableType.name)
        coordinates = position
        
        super.init(texture: texture, color: UIColor.white, size: mineableType.size)
        
        self.position = CGPoint(x: position.x * tileWidth + mineableType.size.width / 2, y: position.y * tileHeight + mineableType.size.height / 2)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = -1
    }
    
    func reveal(_ inventory: Inventory)
    {
        if(!revealed){
            let bulge = SKAction.scale(to: 1.1, duration: 0.05)
            let shrink = SKAction.scale(to: 0, duration: 1)
            let destroy = SKAction.removeFromParent()
            let sequence = SKAction.sequence([bulge, shrink, destroy])
            
            self.zPosition = 1
            
            run(sequence)
            
            inventory.addMineable(mineableType)
            mineableType.value = mineableType.rawValue * manager.getRandomStock().change
            
            revealed = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
