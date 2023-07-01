//
//  VisionCraftApp.swift
//  VisionCraft
//
//  Created by Sigil Wen on 2023-06-30.
//

import SwiftUI

@main
struct VisionCraftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
