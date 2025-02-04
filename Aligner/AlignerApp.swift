//
//  AlignerApp.swift
//  Aligner
//
//  Created by LightningLion on 2025/1/29.
//

import SwiftUI
import MixedRealityKit

@main
struct AlignerApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: appModel.interactivePerspectiveControlViewID) {
            LiveMRData(displayScale:0.3,mrData: $appModel.mrData) { displayImageSize,matBinding in
                InteractivePerspectiveControlView(imageDisplaySize: displayImageSize, originImage: $appModel.cameraImage, screenImagePerspectiveMatrix: matBinding, cameraImageSize: appModel.mrData.cameraImageSize(), panelViewModel: appModel.panelViewModel)
            }
            .onAppear {
                appModel.interactivePerspectiveControlViewOpened = true
            }
            .onDisappear {
                appModel.interactivePerspectiveControlViewOpened = false
            }
        }
        

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView(panelViewModel: appModel.panelViewModel, cameraImage: $appModel.cameraImage, mrData: $appModel.mrData)
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
