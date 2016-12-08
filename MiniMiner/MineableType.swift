//
//  MineableType.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

enum MineableType: Int{
    case poke, gem
    
    var name: String {
        let names = [
            "Poke",
            "Gem"]
        
        return names[rawValue]
    }
    
    var coordinates: [CGPoint]{
        
        let pokeCoords = [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)]
        
        var gemCoords = [CGPoint]()
            gemCoords.append(CGPoint(x: 0, y: 0))
            gemCoords.append(CGPoint(x: 1, y: 0))
            gemCoords.append(CGPoint(x: 2, y: 0))
            gemCoords.append(CGPoint(x: 3, y: 0))
            gemCoords.append(CGPoint(x: 4, y: 0))
            gemCoords.append(CGPoint(x: 0, y: 1))
            gemCoords.append(CGPoint(x: 0, y: 2))
            gemCoords.append(CGPoint(x: 0, y: 3))
            gemCoords.append(CGPoint(x: 0, y: 4))
            gemCoords.append(CGPoint(x: 4, y: 1))
            gemCoords.append(CGPoint(x: 4, y: 2))
            gemCoords.append(CGPoint(x: 4, y: 3))
            gemCoords.append(CGPoint(x: 4, y: 4))
            gemCoords.append(CGPoint(x: 1, y: 4))
            gemCoords.append(CGPoint(x: 2, y: 4))
            gemCoords.append(CGPoint(x: 3, y: 4))
        
        let coordinates = [pokeCoords, gemCoords]
        
        return coordinates[rawValue]
    }

    var value: Int{
        let value = [
            200, 400
        ]
        
        return value[rawValue]
    }
    
    var size: CGSize{
        
        var size = CGSize()
        
        for point in coordinates
        {
            size.width = max(size.width, point.x + 1)
            size.height = max(size.height, point.y + 1)
        }
        
        return CGSize(width: size.width * tileWidth, height: size.height * tileHeight)
    }
    
    
    fileprivate static let count: MineableType.RawValue = {
        // find the maximum enum value
        var maxValue: Int = 0
        while let _ = MineableType(rawValue: maxValue) {
            maxValue += 1
        }
        return maxValue
    }()
    
    static func randomMineableType() -> MineableType {
        // pick and return a new value
        let rand = Int(arc4random_uniform(UInt32(count)))
        return MineableType(rawValue: rand)!
    }
}
