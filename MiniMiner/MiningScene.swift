//
//  GameScene.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/18/16.
//  Copyright (c) 2016 Pixelaborate. All rights reserved.
//

import SpriteKit

class MiningScene: GameScene {
    
    let wall: Wall
    let ui: MiningUI
    
    override init(_ game: Game) {
        wall = Wall()
        ui = MiningUI()
        
        super.init(game)
        
        mainLayer.addChild(wall)
        mainLayer.addChild(ui.uiLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        ui.update()
        wall.update(game)
    }
}
