//
//  Wall.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 11/29/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class Wall : SKNode{
    
    let numberOfCols = 16
    let numberOfRows = 12
    
    private var rocks: [[Rock]]
    private var mineables: [Mineable]
    
    private var durability: Int
    private var wallBroke: Bool
    
    override init()
    {
        rocks = [[Rock]]()
        mineables = [Mineable]()
        durability = 100
        wallBroke = false
        
        super.init()
        
        userInteractionEnabled = true
        
        placeRocks()
        placeMineables()
        
        drawMineables()
        drawRocks()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(game: Game)
    {
        mineableRevealed(game.inventory)
        
        if(durability <= 0 && !wallBroke)
        {
            let amplitude = CGVector(dx: 10, dy: 10)
            let numberOfShakes = 10
            
            var shakes = [SKAction]()
            
            for _ in 0..<numberOfShakes {
                let moveX = CGFloat(arc4random_uniform(UInt32(amplitude.dx))) - amplitude.dx / 2;
                let moveY = CGFloat(arc4random_uniform(UInt32(amplitude.dy))) - amplitude.dy / 2;
                let oneShake = SKAction.moveByX(moveX, y: moveY, duration: 0.02);
                oneShake.timingMode = SKActionTimingMode.EaseOut;
                shakes.append(oneShake);
                shakes.append(oneShake.reversedAction());
            }
            
            let wait = SKAction.waitForDuration(0.5)
            let shake = SKAction.sequence(shakes)
            
            let sequence = SKAction.sequence([wait, shake])
            runAction(sequence, completion: {game.ChangeScene(UndergroundScene(game), transition: SKTransition.fadeWithDuration(0.3))})
            
            wallBroke = true
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if(durability > 0)
        {
            for touch in touches{
            let loc = touch.locationInNode(self)
            
            let x: Int = Int(loc.x / tileWidth)
            let y: Int = Int(loc.y / tileHeight)
            
            rocks[x][y].breakRock()
            
            durability -= 1
            
                if(miningMode == .hammer)
                {
                    durability -= 6
                    
                    if(x < numberOfCols - 1)
                    {
                        rocks[x + 1][y].breakRock()
                    }
                    if(y < numberOfRows - 1)
                    {
                        rocks[x][y + 1].breakRock()
                    }
                    if(x < numberOfCols - 1 && y < numberOfRows - 1)
                    {
                        rocks[x + 1][y + 1].breakRock()
                    }
                    if(x < numberOfCols - 1 && y > 0)
                    {
                        rocks[x + 1][y - 1].breakRock()
                    }
                    if(x > 0)
                    {
                        rocks[x - 1][y].breakRock()
                    }
                    if(y > 0)
                    {
                        rocks[x][y - 1].breakRock()
                    }
                    if(x > 0 && y > 0)
                    {
                        rocks[x - 1][y - 1].breakRock()
                    }
                    if(x > 0 && y < numberOfRows - 1)
                    {
                        rocks[x - 1][y + 1].breakRock()
                    }
                }
            }
        }
    }
    
    func mineableRevealed(inventory : Inventory)
    {
        for mineable in mineables{
            var revealed = true
            for coordinate in mineable.mineableType.coordinates{
                if(rocks[Int(coordinate.x + mineable.coordinates.x)][Int(coordinate.y + mineable.coordinates.y)].parent != nil){
                    revealed = false
                }
            }
            
            if(revealed){
                mineable.reveal(inventory)
            }
        }
    }
    
    func placeRocks()
    {
        for i in 0..<numberOfCols{
            rocks.append([Rock]())
            for j in 0..<numberOfRows{
                rocks[i].append((Rock(position: CGPoint(x: i, y: j), type: RockType(rawValue: Int(arc4random_uniform(3)))!)))
            }
        }
    }
    
    func placeMineables()
    {
        for i in 0..<numberOfCols{
            for j in 0..<numberOfRows{
                if(96 < arc4random_uniform(100))
                {
                    let rockType = MineableType.randomMineableType()
                    
                    if(canPlaceMineableAt(CGPoint(x: i, y: j), type: rockType))
                    {
                        mineables.append(Mineable(position: CGPoint(x: i, y: j), mineableType: rockType))
                    }
                }
            }
        }
    }
    
    func drawRocks()
    {
        for i in 0..<numberOfCols{
            for j in 0..<numberOfRows{
                addChild(rocks[i][j])
            }
        }
    }
    
    func drawMineables()
    {
        for i in 0..<mineables.count{
            addChild(mineables[i])
        }
    }
    
    func canPlaceMineableAt(point: CGPoint, type: MineableType)->Bool{
        // Tests to see if the newly placed mineable overlaps with an old mineable
        for mineable in mineables{
            for oldMineableCoordinate in mineable.mineableType.coordinates{
                for newMineableCoordinate in type.coordinates{
                    if(mineable.coordinates.x + oldMineableCoordinate.x == point.x + newMineableCoordinate.x && mineable.coordinates.y + oldMineableCoordinate.y == point.y + newMineableCoordinate.y){
                        return false
                    }
                }
            }
        }
        
        // Tests to see if the newly placed mineable is outside of the grid
        for newMineableCoordinate in type.coordinates {
            if(point.x + newMineableCoordinate.x >= CGFloat(numberOfCols) || point.y + newMineableCoordinate.y >= CGFloat(numberOfRows)){
                return false
            }
        }
        
        return true
    }
}