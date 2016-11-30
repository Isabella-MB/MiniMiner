//
//  Rock.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/30/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

enum RockType: Int{
    case nothing = 0, soft, medium, hard
    
    var spriteName: String {
        let spriteNames = [
            "",
            "Soft",
            "Medium",
            "Hard"]
        
        return spriteNames[rawValue]
    }
}

class Rock: SKSpriteNode{
    var rockType: RockType
    
    let tileWidth: CGFloat = 60.0
    let tileHeight: CGFloat = 60.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(position: CGPoint, type: RockType)
    {
        rockType = type
        
        let texture = SKTexture(imageNamed: rockType.spriteName) 
        super.init(texture: texture, color: UIColor.whiteColor(), size: CGSize(width: tileWidth, height: tileHeight))
        
        self.position = CGPoint(x: position.x * tileWidth, y: position.y * tileHeight)
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.userInteractionEnabled = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchedd")
        rockType = RockType(rawValue: rockType.rawValue - 1)!
        texture = SKTexture(imageNamed: rockType.spriteName)
    }
}
