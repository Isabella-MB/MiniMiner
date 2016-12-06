//
//  Sparkle.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class Sparkle: SKSpriteNode
{
    var touched: Bool
    
    init(position: CGPoint)
    {
        let frame1 = SKTexture(imageNamed: "Sparkle")
        let frame2 = SKTexture(imageNamed: "Sparkle2")
        touched = false
        
        super.init(texture: frame1, color: UIColor.whiteColor(), size: CGSize(width: 60, height: 60))
        
        self.position = position
        self.zPosition = -1
        self.userInteractionEnabled = true
        
        let wait = SKAction.waitForDuration(5)
        let destroy = SKAction.removeFromParent()
        let sequence = SKAction.sequence([wait, destroy])
        
        runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([frame1, frame2], timePerFrame: 0.1)))
        runAction(sequence)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touched = true
    }
}