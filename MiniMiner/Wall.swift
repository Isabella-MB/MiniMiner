//
//  Wall.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/29/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class Wall{
    
    let numberOfRows = 16
    let numberOfCols = 12
    let wallLayer = SKNode()
    
    private var rocks: [[Rock]]
    private var mineables: [Mineable]
    
    let numberOfMineables: Int
    
    init()
    {
        rocks = [[Rock]]()
        mineables = [Mineable]()
        
        for i in 0..<numberOfRows{
            rocks.append([Rock]())
            for j in 0..<numberOfCols{
                rocks[i].append((Rock(position: CGPoint(x: i, y: j), type: RockType(rawValue: Int(arc4random_uniform(3)))!)))
                if(75 < arc4random_uniform(100))
                {
                    var coordTaken = false;
                    
                    for mineable in mineables{
                        for coordinate in mineable.mineableType.coordinates{
                            if(mineable.coordinates.x + coordinate.x == CGFloat(i) && mineable.coordinates.y + coordinate.y == CGFloat(j)){
                                coordTaken = true
                            }
                        }
                    }
                    
                    if(!coordTaken)
                    {
                        mineables.append(Mineable(position: CGPoint(x: i, y: j), mineableType: MineableType.platinum))
                    }
                }
            }
        }
        
        numberOfMineables = mineables.count
        
        for i in 0..<numberOfRows{
            for j in 0..<numberOfCols{
                wallLayer.addChild(rocks[i][j])
            }
        }
        for i in 0..<numberOfMineables{
            let sprite = SKSpriteNode(color: UIColor(red: CGFloat(Float(i) / Float(numberOfMineables)), green: CGFloat(Float(i) / Float(numberOfMineables)), blue: CGFloat(Float(i) / Float(numberOfMineables)), alpha: 1), size: CGSize(width: tileWidth * 2, height: tileHeight * 2))
            sprite.position = mineables[i].position
            sprite.anchorPoint = CGPoint(x: 0, y: 0)
            wallLayer.addChild(sprite)
            wallLayer.addChild(mineables[i])
        }
    }
    
    func rockAt(pos: CGPoint) -> Rock
    {
        return rocks[Int(pos.x)][Int(pos.y)]
    }
}