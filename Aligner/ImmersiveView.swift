//
//  ImmersiveView.swift
//  Aligner
//
//  Created by LightningLion on 2025/1/29.
//

import SwiftUI
import RealityKit
import RealityKitContent
import MixedRealityKit
import DoubleEye

struct ImmersiveView: View {
    @State
    var panelViewModel:PanelViewModel
    @Binding
    var cameraImage:CGImage?
    @Binding
    var mrData:MRData
    var body: some View {
        CameraPassthroughAligner(doubleEyeBundle: doubleEyeBundle, panelViewModel: panelViewModel, cameraImage: $cameraImage, mrData: $mrData)
    }
}

