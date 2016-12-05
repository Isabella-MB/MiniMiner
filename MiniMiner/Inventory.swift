//
//  Inventory.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation

class Inventory{
    var collectedMineables: [MineableType]
    
    init()
    {
        collectedMineables = [MineableType]()
        
        for _ in 0..<16
        {
            collectedMineables.append(MineableType.gem)
        }
    }
    
    func addMineable(mineable: MineableType)
    {
        collectedMineables.append(mineable)
    }
}