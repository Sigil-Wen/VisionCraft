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
    var body: some View {
        RealityView { content in
            
                if let cubeEntity = createGrassBlock() {
                    content.add(cubeEntity)
                    cubeEntity.position.x -= 0.3 // Adjust the x-position of the grass block
                }
                if let cubeEntity = createCobblestoneBlock() {
                    content.add(cubeEntity)
                }
            
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

}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
