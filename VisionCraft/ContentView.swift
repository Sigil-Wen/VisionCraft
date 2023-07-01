//
//  ContentView.swift
//  VisionCraft
//
//  Created by Sigil Wen on 2023-06-30.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State var showImmersiveSpace = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
            ZStack {
                VStack {
                    Image("Logo")
                    
                    Toggle("Begin", isOn: $showImmersiveSpace)
                        .toggleStyle(.button)
                        .padding(.top, 50)
                }
                
                Model3D(named: "grass")
                    .scaleEffect(x: 0.2, y: 0.2, z: 0.2)
                    .offset(z: -150)
                    .offset(x: 50, y: -150)
                    .rotation3DEffect(Rotation3D(angle: Angle2D(Angle(degrees: 30)), axis: RotationAxis3D(x: -45, y:70, z: 0)))
            }
            .navigationTitle("Content")
            .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                    print("LESGO")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
