//
//  ContentView.swift
//  Aligner
//
//  Created by LightningLion on 2025/1/29.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack(spacing: 30) {
            Text("这个App将帮助你对齐相机画面")
                .font(.extraLargeTitle)
            VStack(alignment: .leading,spacing: 22) {
                Text("请先打开Immersive Space")
                    .font(.headline)
                Text("再打开Interactive Perspective Control View")
                    .font(.headline)
            }
            ToggleImmersiveSpaceButton()
            
            ToggleInteractivePerspectiveControlView()
        }
        .padding()
    }
}


struct ToggleInteractivePerspectiveControlView: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.openWindow)
    private var openWindow
    var body: some View {
        Button {
            openWindow.callAsFunction(id: appModel.interactivePerspectiveControlViewID)
        } label: {
            Text(appModel.interactivePerspectiveControlViewOpened ? "Hide Interactive Perspective Control View" : "Show Interactive Perspective Control View")
        }
        .animation(.none, value: 0)
        .fontWeight(.semibold)
    }
}


#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
