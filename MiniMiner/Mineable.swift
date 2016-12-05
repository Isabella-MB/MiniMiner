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
    case poke, gem
    
    var spriteName: String {
        let spriteNames = [
            "Poke",
            "Gem"]
        
        return spriteNames[rawValue]
    }
    
    var coordinates: [CGPoint]{
        let coordinates = [
            [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
            [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 3, y: 0), CGPoint(x: 4, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 0, y: 3), CGPoint(x: 0, y: 4), CGPoint(x: 4, y: 1), CGPoint(x: 4, y: 2), CGPoint(x: 4, y: 3), CGPoint(x: 4, y: 4), CGPoint(x: 1, y: 4), CGPoint(x: 2, y: 4), CGPoint(x: 3, y: 4)]
        ]
        
        return coordinates[rawValue]
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
    
    private static let count: MineableType.RawValue = {
        // find the maximum enum value
        var maxValue: Int = 0
        while let _ = MineableType(rawValue: maxValue) {
            maxValue += 1
        }
        return maxValue
    }()
    
    static func randomMineableType() -> MineableType {
        // pick and return a new value
        let rand = Int(arc4random_uniform(UInt32(count)))
        return MineableType(rawValue: rand)!
    }
}

class Mineable: SKSpriteNode {
    
    var mineableType: MineableType;
    var coordinates: CGPoint;
    
    var revealed = false;
    
    init(position: CGPoint, mineableType: MineableType)
    {
        self.mineableType = mineableType
        
        let texture = SKTexture(imageNamed: mineableType.spriteName)
        coordinates = position
        
        super.init(texture: texture, color: UIColor.whiteColor(), size: mineableType.size)
        
        self.position = CGPoint(x: position.x * tileWidth + mineableType.size.width / 2, y: position.y * tileHeight + mineableType.size.height / 2)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = -1
    }
    
    func reveal()
    {
        if(!revealed){
            let bulge = SKAction.scaleTo(1.1, duration: 0.05)
            let shrink = SKAction.scaleTo(0, duration: 1)
            let sequence = SKAction.sequence([bulge, shrink])
            
            self.zPosition = 1
            
            runAction(sequence)
            
            revealed = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
