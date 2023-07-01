//
//  ImmersiveView.swift
//  VisionCraft
//
//  Created by Sigil Wen on 2023-06-30.
//

import SwiftUI
import RealityKit
import RealityKitContent
import UIKit

struct ImmersiveView: View {
    
    @ObservedObject var worldModel: VisionCraftWorld = VisionCraftWorld()
    
    var body: some View {
        RealityView { content in
            for x in 0..<worldModel.dimensions {
                for y in 0..<worldModel.dimensions {
                    for z in 0..<worldModel.dimensions {
                        let block = worldModel.world[x][y][z]
                        // Perform operations with the block value
                    
                        if block == 1 {
                            if let cubeEntity = createGrassBlock() {
                                content.add(cubeEntity)
                                cubeEntity.position.x += 0.2*Float(x) // Adjust the x-position of the grass block
                                cubeEntity.position.y += 0.2*Float(y) - 0.2 // Adjust the y-position of the grass block
                                cubeEntity.position.z += 0.2*Float(z) // Adjust the z-position of the grass block
                            }
                        } else if block == 2 {
                            if let cubeEntity = createWoodenPlankBlock() {
                                content.add(cubeEntity)
                                cubeEntity.position.x += 0.2*Float(x) // Adjust the x-position of the grass block
                                cubeEntity.position.y += 0.2*Float(y) - 0.2 // Adjust the y-position of the grass block
                                cubeEntity.position.z += 0.2*Float(z) // Adjust the z-position of the grass block
                            }
                        }
                    }
                }
            }
            
//            if let cubeEntity = createCobblestoneBlock() {
//                content.add(cubeEntity)
//            }
//            if let woodenPlank = createWoodenPlankBlock() {
//                content.add(woodenPlank)
//                woodenPlank.position.x += 0.3
//            }
            
        }
    }
    
    func createGrassBlock() -> ModelEntity? {
        let cubeMesh = MeshResource.generateBox(width: 0.2, height: 0.2, depth: 0.2, splitFaces: true)
        
        var grassSide = SimpleMaterial()
        var dirt = SimpleMaterial()
        var grassTop = SimpleMaterial()
        
        do {
            let grassTexture = try TextureResource.load(named: "grass_block_side.png")
            grassSide.baseColor = MaterialColorParameter.texture(grassTexture)
            
            let dirtTexture = try TextureResource.load(named: "dirt.png")
            dirt.baseColor = MaterialColorParameter.texture(dirtTexture)
            
            let grass = try TextureResource.load(named: "grass_top.png")
            grassTop.baseColor = MaterialColorParameter.texture(grass)
            
        } catch {
            print("Failed to load texture:", error)
            return nil
        }
        
        let cubeEntity = ModelEntity(mesh: cubeMesh)
        
        cubeEntity.model?.materials = [grassSide, grassTop, grassSide, dirt, grassSide, grassSide]
        
        return cubeEntity
    }
    
    func createCobblestoneBlock() -> ModelEntity? {
        let cubeMesh = MeshResource.generateBox(width: 0.2, height: 0.2, depth: 0.2, splitFaces: true)
        
        var cobblestone = SimpleMaterial()
        
        do {
            let cobblestoneTexture = try TextureResource.load(named: "cobblestone.png")
            cobblestone.baseColor = MaterialColorParameter.texture(cobblestoneTexture)
        } catch {
            print("Failed to load texture:", error)
            return nil
        }
        
        let cubeEntity = ModelEntity(mesh: cubeMesh)
        
        cubeEntity.model?.materials = [cobblestone, cobblestone, cobblestone, cobblestone, cobblestone, cobblestone]
        
        return cubeEntity
    }
    
    func createWoodenPlankBlock() -> ModelEntity? {
        let cubeMesh = MeshResource.generateBox(width: 0.2, height: 0.2, depth: 0.2, splitFaces: true)
        
        var woodenPlank = SimpleMaterial()

        do {
            let woodenPlankTexture = try TextureResource.load(named: "oak_planks.png")
            woodenPlank.baseColor = MaterialColorParameter.texture(woodenPlankTexture)
        } catch {
            print("Failed to load texture:", error)
            return nil
        }

        let cubeEntity = ModelEntity(mesh: cubeMesh)

        cubeEntity.model?.materials = [woodenPlank, woodenPlank, woodenPlank, woodenPlank, woodenPlank, woodenPlank]

        return cubeEntity
    }

}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
