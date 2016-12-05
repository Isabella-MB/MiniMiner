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
    
    var enabled: Bool = true {
        didSet {
            if(!enabled){
                runAction(SKAction.colorizeWithColor(UIColor.blackColor(), colorBlendFactor: 1, duration: 0.3))
            }
        }
    }
    var selected: Bool = false {
        didSet {
            if(selected){
                runAction(SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 0.5, duration: 0.01))
            }
            else
            {
                runAction(SKAction.colorizeWithColor(UIColor.whiteColor(), colorBlendFactor: 1, duration: 0.01))
            }
        }
    }
    
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
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent!) {
        
        if (!enabled) {
            return
        }
        selected = false
    }
    
}