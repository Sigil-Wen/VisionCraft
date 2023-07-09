//
//  BackgroundField.swift // Adopted from Apple's hello world - wow VisionOS doesn't have support for real full immersion. it's all an illusion
//  VisionCraft
//
//  Created by Sigil Wen on 2023-07-09.
//

import Foundation
import SwiftUI
import RealityKit

/// A large sphere that has minecrafts
///
/// When centered on the viewer, this entity creates the illusion of floating
/// in space.
struct BackgroundField: View {
    var body: some View {
        RealityView { content in
            guard let resource = try? TextureResource.load(named: "Starfield") else {
                // If the asset isn't available, something is wrong with the app.
                fatalError("Unable to load starfield texture.")
            }
            var material = UnlitMaterial()
            material.color = .init(texture: .init(resource))
            
            // Attach the material to a large sphere.
            let entity = Entity()
            entity.components.set(ModelComponent(
                mesh: .generateSphere(radius: 1000),
                materials: [material]
            ))
            

            // Ensure the texture image points inward at the viewer.
            entity.scale *= .init(x: -1, y: 1, z: 1)

            content.add(entity)
        }
    }
}
