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
    case soft, medium, hard
    
    var spriteName: String {
        let spriteNames = [
            "Soft",
            "Medium",
            "Hard"]
        
        return spriteNames[rawValue]
    }
}

class Rock: SKSpriteNode{
    var rockType: RockType
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(position: CGPoint, type: RockType)
    {
        rockType = type
        
        let texture = SKTexture(imageNamed: rockType.spriteName) 
        super.init(texture: texture, color: UIColor.white, size: CGSize(width: tileWidth, height: tileHeight))
        
        self.position = CGPoint(x: position.x * tileWidth + tileWidth / 2, y: position.y * tileHeight + tileHeight / 2)
        self.setScale(1.01)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    func breakRock()
    {
        let particleEmitter = SKEmitterNode()
        
        particleEmitter.particleBirthRate = 10000
        particleEmitter.emissionAngleRange = 6.28
        particleEmitter.numParticlesToEmit = 10
        particleEmitter.position = CGPoint(x: position.x, y: position.y)
        particleEmitter.particlePositionRange = CGVector(dx: tileWidth / 2, dy: tileHeight / 2)
        particleEmitter.particleLifetime = 1
        particleEmitter.particleTexture = SKTexture(imageNamed: rockType.spriteName + "Particle")
        particleEmitter.particleScaleRange = 0.25
        particleEmitter.particleScale = 1
        particleEmitter.particleSpeed = 80
        particleEmitter.particleAlphaSpeed = -1
        particleEmitter.particleRotationRange = 40
        particleEmitter.particleRotationSpeed = 3
        particleEmitter.particleSpeedRange = 20
        particleEmitter.particleSize = CGSize(width: 60, height: 60)
        particleEmitter.zPosition = 2
        
        let wait = SKAction.wait(forDuration: 1)
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([wait, remove])
        
        particleEmitter.run(sequence)
        
        parent?.addChild(particleEmitter)
        
        if(rockType.rawValue > 0)
        {
            rockType = RockType(rawValue: rockType.rawValue - 1)!
            texture = SKTexture(imageNamed: rockType.spriteName)
        }
        
        else{
            removeFromParent()
        }
    }
}
