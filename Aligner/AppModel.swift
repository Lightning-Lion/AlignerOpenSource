//
//  AppModel.swift
//  PlayWithMixedRealityKit
//
//  Created by LightningLion on 2024/11/22.
//

import SwiftUI
import MixedRealityKit

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let interactivePerspectiveControlViewID = "InteractivePerspectiveControlView"
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    
    var interactivePerspectiveControlViewOpened = false
    var immersiveSpaceState = ImmersiveSpaceState.closed
    
    
    var cameraImage:CGImage?
    var panelViewModel:PanelViewModel = PanelViewModel()
    
    var mrData:MRData = .defaultValue
}
