//
//  Inventory.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation

class Inventory{
    var collectedMineables: [MineableType: Int]
    
    init()
    {
        collectedMineables = [MineableType: Int]()
        for i in 0..<MineableType.count{
            collectedMineables[MineableType(rawValue: i)!] = 1
        }
    }
    
    func addMineable(_ mineable: MineableType)
    {
        collectedMineables[mineable]! += 1
    }
}
