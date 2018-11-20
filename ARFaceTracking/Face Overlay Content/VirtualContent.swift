//
//  VirtualContent.swift
//  ARFaceTracking
//
//  Created by Henry Morris on 20/11/2018.
//  Copyright © 2018 Altair. All rights reserved.
//

import ARKit
import SceneKit

enum VirtualContentType: Int {
    case transforms, texture, geometry, videoTexture, blendShape
    
    func makeController() -> VirtualContentController {
        switch self {
        case .transforms:
            return TransformVisualization()
        case .texture:
            return TexturedFace()
        case .geometry:
            return FaceOcclusionOverlay()
        case .videoTexture:
            return VideoTexturedFace()
        case .blendShape:
            return BlendShapeCharacter()
        }
    }
}

/// For forwarding 'ARSCNViewDelegate' message to the object controlling the currently visible virtual content.
protocol VirtualContentController: ARSCNViewDelegate {
    var contentNode: SCNNode? { get set } // root node for the virtual content
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode?
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor)
}
