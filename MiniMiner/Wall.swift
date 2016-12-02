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
    
    init()
    {
        rocks = [[Rock]]()
        mineables = [Mineable]()
        
        for i in 0..<numberOfRows{
            rocks.append([Rock]())
            for j in 0..<numberOfCols{
                rocks[i].append((Rock(position: CGPoint(x: i, y: j), type: RockType(rawValue: Int(arc4random_uniform(3)))!)))
                if(96 < arc4random_uniform(100))
                {
                    let rockType = MineableType.platinum
                    
                    var coordTaken = false;
                    
                    // Tests to see if the newly placed mineable overlaps with an old mineable
                    for mineable in mineables{
                        for oldMineableCoordinate in mineable.mineableType.coordinates{
                            for newMineableCoordinate in rockType.coordinates{
                                if(mineable.coordinates.x + oldMineableCoordinate.x == CGFloat(i) + newMineableCoordinate.x && mineable.coordinates.y + oldMineableCoordinate.y == CGFloat(j) + newMineableCoordinate.y){
                                    coordTaken = true
                                }
                            }
                        }
                    }
                    
                    // Tests to see if the newly placed mineable is outside of the grid
                    for newMineableCoordinate in rockType.coordinates {
                        if((CGFloat(i) + newMineableCoordinate.x >= CGFloat(numberOfRows)) || (CGFloat(j) + newMineableCoordinate.y >= CGFloat(numberOfCols))){
                            coordTaken = true
                        }
                    }
                    
                    if(!coordTaken)
                    {
                        mineables.append(Mineable(position: CGPoint(x: i, y: j), mineableType: rockType))
                    }
                }
            }
        }
        
        for i in 0..<mineables.count{
            wallLayer.addChild(mineables[i])
        }
        
        for i in 0..<numberOfRows{
            for j in 0..<numberOfCols{
                wallLayer.addChild(rocks[i][j])
            }
        }
        
    }
    
    func rockAt(pos: CGPoint) -> Rock
    {
        return rocks[Int(pos.x)][Int(pos.y)]
    }
}