//
//  Mineables.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/1/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

enum MineableType: Int{
    case platinum
    
    var spriteName: String {
        let spriteNames = [
            "Rock"]
        
        return spriteNames[rawValue]
    }
    
    var coordinates: [CGPoint]{
        let size = [
            [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)]
        ]
        
        return size[rawValue]
    }
    
    var size: CGSize{
        
        var size = CGSize()
        
        for point in coordinates
        {
            size.width = max(size.width, point.x + 1)
            size.height = max(size.height, point.y + 1)
        }
        
        return CGSize(width: size.width * tileWidth, height: size.height * tileHeight)
    }
}

class Mineable: SKSpriteNode {
    
    var mineableType: MineableType;
    
    init(position: CGPoint, mineableType: MineableType)
    {
        self.mineableType = mineableType
        
        let texture = SKTexture(imageNamed: mineableType.spriteName)
        
        super.init(texture: texture, color: UIColor.whiteColor(), size: mineableType.size)
        
        self.position = CGPoint(x: position.x * tileWidth, y: position.y * tileHeight)
        self.anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
