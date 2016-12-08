//
//  SKScrollMenu.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class SKVerticalScrollMenu : SKCropNode{
    
    var yStart: CGFloat
    var yLast: CGFloat
    
    let scrollSpeed: CGFloat
    let maskSize: CGSize
    let totalSize: CGSize

    let scrollLayer: SKSpriteNode
    
    init(position: CGPoint, size: CGSize, childNodes: [SKNode])
    {
        yStart = 0
        yLast = 0
        scrollSpeed = 1.0
        maskSize = size
        scrollLayer = SKSpriteNode(texture: nil, size: size)
        
        for child in childNodes{
            scrollLayer.addChild(child)
        }
        
        let height = scrollLayer.calculateAccumulatedFrame().height
        totalSize = CGSize(width: size.width, height: height)
        
        super.init()
        
        self.position = position
        
        addChild(scrollLayer)
        
        let mask = SKTexture()
        maskNode = SKSpriteNode(texture: mask, size: size)
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        
        yStart = location!.y
        yLast = location!.y
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        
        let yDelta = (location!.y - yLast) * scrollSpeed
        
        if(scrollLayer.position.y + yDelta > 0 && scrollLayer.position.y + yDelta < totalSize.height - maskSize.height){
            scrollLayer.position.y += yDelta
        }
        else if(scrollLayer.position.y + yDelta < 0){
            scrollLayer.position.y = 0
        }
        else if(scrollLayer.position.y + yDelta > totalSize.height - maskSize.height){
            scrollLayer.position.y = totalSize.height - maskSize.height
        }
        
        yLast = location!.y
    }
}
