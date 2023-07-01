//
//  VisionCraftWorldModel.swift
//  VisionCraft
//
//  Created by Sigil Wen on 2023-06-30.
//

import Foundation

class VisionCraftWorld: ObservableObject {
    @Published var world: [[[Int]]] = []
    
    @Published var dimensions: Int = 4
    
    init() {
        
        self.dimensions = 4
        
        self.world = Array(repeating: Array(repeating: Array(repeating: 0, count: dimensions), count: dimensions), count: dimensions)

        for x in 0..<dimensions {
            for z in 0..<dimensions {
                world[x][0][z] = 1
            }
        }
        
        world[1][1][1] = 1 // The lone block
        
        world[0][1][0] = 2 // The lone block
        world[0][2][0] = 2 // The lone block
        world[0][3][0] = 2 // The lone block
        
        print(world)
    }
}
