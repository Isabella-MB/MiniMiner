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
        
        for i in 0..<12{
            if(i % 2 == 0)
            {
                collectedMineables.append(MineableType.gem)
            }
            else{
                collectedMineables.append(MineableType.poke)
            }
        }
    }
    
    func addMineable(_ mineable: MineableType)
    {
        collectedMineables.append(mineable)
    }
}
