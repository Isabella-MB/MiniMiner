//
//  SKButton.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/2/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class SKButton: SKSpriteNode{
    
    var enabled: Bool = true
    var selected: Bool = false
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(position: CGPoint, texture : SKTexture!, size: CGSize) {
        
        super.init(texture: texture, color: UIColor.whiteColor(), size: size)
        
        self.position = position
        
        userInteractionEnabled = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent!)  {
        
        if (!enabled) {
            return
        }
        
        selected = true
        
        runAction(SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 0.5, duration: 0.01))
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent!) {
        
        if (!enabled) {
            return
        }
        selected = false
        runAction(SKAction.colorizeWithColor(UIColor.whiteColor(), colorBlendFactor: 1, duration: 0.01))
    }
    
}