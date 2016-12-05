//
//  TitleScene.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/28/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class TitleScene: GameScene {
    
    let ui: TitleUI
    
    override init(_ game: Game) {
        ui = TitleUI()
        
        super.init(game)
        
        mainLayer.addChild(ui.uiLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        ui.update(game)
    }
}
