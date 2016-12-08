//
//  GameScene.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/29/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SKScene{
    let game: Game
    let mainLayer: SKNode
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
    }
    
    init(_ game: Game) {
        self.game = game
        mainLayer = SKNode()
        
        super.init(size: CGSize(width: 1280, height: 720))
        
        scaleMode = .fill
        addChild(mainLayer)
    }
}
