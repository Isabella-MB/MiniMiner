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
    
    let numberOfRows = 12
    let numberOfCols = 12
    let wallLayer = SKNode()
    
    private var rocks: [[Rock]]
    
    init()
    {
        rocks = [[Rock]]()
        
        for i in 0..<numberOfRows{
            rocks.append([Rock]())
            for j in 0..<numberOfCols{
                rocks[i].append((Rock(position: CGPoint(x: i, y: j), type: randomRock())))
            }
        }
        
        for i in 0..<numberOfRows{
            for j in 0..<numberOfCols{
                wallLayer.addChild(rocks[i][j])
            }
        }
    }
    
    func randomRock() -> RockType
    {
        return RockType(rawValue: Int(arc4random_uniform(3)) + 1)!
    }
    
    func rockAt(pos: CGPoint) -> Rock
    {
        return rocks[Int(pos.x)][Int(pos.y)]
    }
}