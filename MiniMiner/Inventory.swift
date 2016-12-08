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
    }
    
    func addMineable(_ mineable: MineableType)
    {
        collectedMineables.append(mineable)
    }
}
