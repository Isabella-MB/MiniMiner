//
//  Underground.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class Underground : SKNode{
    let background: SKSpriteNode
    let sidebar: SKSpriteNode
    
    var sparkles: [Sparkle]
    
    override init()
    {
        background = SKSpriteNode(imageNamed: "Underground")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.zPosition = -20
        
        sidebar = SKSpriteNode(imageNamed: "Sidebar")
        sidebar.anchorPoint = CGPoint(x: 0, y: 0)
        sidebar.position = CGPoint(x: 960, y: 200)
        sidebar.zPosition = -20
        
        sparkles = [Sparkle]()
        
        super.init()
        
        addChild(background)
        addChild(sidebar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(game: Game)
    {
        if(arc4random() % 100 > 90)
        {
            let wallPosition = arc4random() % 3
            
            switch(wallPosition)
            {
                case 0:
                    sparkles.append(Sparkle(position: CGPoint(x: Int(arc4random() % 930 + 30), y: 30)))
                    break
                case 1:
                    sparkles.append(Sparkle(position: CGPoint(x: Int(arc4random() % 930 + 30), y: 690)))
                    break
                case 2:
                    sparkles.append(Sparkle(position: CGPoint(x: 30, y: Int(arc4random() % 690 + 30))))
                    break
                case 3:
                    sparkles.append(Sparkle(position: CGPoint(x: 930, y: Int(arc4random() % 930 + 30))))
                    break
                default: break
            }
            
            addChild(sparkles.last!)
        }
        
        for sparkle in sparkles
        {
            if(sparkle.touched)
            {
                game.ChangeScene(MiningScene(game), transition: SKTransition.doorsOpenHorizontalWithDuration(2))
            }
        }
    }
    
}