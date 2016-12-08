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
        
        super.init(texture: texture, color: UIColor.white, size: size)
        
        self.position = position
        
        isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!)  {
        
        if (!enabled) {
            return
        }
        
        selected = true
        
        run(SKAction.colorize(with: UIColor.green, colorBlendFactor: 0.5, duration: 0.01))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent!) {
        
        if (!enabled) {
            return
        }
        selected = false
        run(SKAction.colorize(with: UIColor.white, colorBlendFactor: 1, duration: 0.01))
    }
    
}
