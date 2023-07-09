//
//  VisionCraftApp.swift
//  VisionCraft
//
//  Created by Sigil Wen on 2023-06-30.
//

import SwiftUI

@main
struct VisionCraftApp: App {
    
    @State private var worldImmersionStyle: ImmersionStyle = .full

    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: $worldImmersionStyle, in: .full)
    }
}
