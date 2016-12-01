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
    
    override init(_ game: Game) {
        wall = Wall()
        
        super.init(game)
        
        mainLayer.addChild(wall.wallLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
    }
    
    func swipedLeft(sender: UISwipeGestureRecognizer)
    {
        game.ChangeScene(TitleScene(game), transition: SKTransition.pushWithDirection(.Left, duration: 0.4))
        game.skView.removeGestureRecognizer(sender)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
