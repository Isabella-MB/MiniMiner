//
//  OverworldScene.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class UndergroundScene: GameScene{
    
    let underground: Underground
    let sidebar: Sidebar
    
    override init(_ game: Game) {
        
        underground = Underground()
        sidebar = Sidebar(inventory: game.inventory)
        
        super.init(game)
        
        mainLayer.addChild(underground)
        mainLayer.addChild(sidebar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
        underground.update(game)
    }
}
