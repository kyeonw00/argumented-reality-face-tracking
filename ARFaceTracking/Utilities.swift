//
//  Utilities.swift
//  ARFaceTracking
//
//  Created by Henry Morris on 20/11/2018.
//  Copyright © 2018 Altair. All rights reserved.
//

import ARKit
import SceneKit

extension SCNMatrix4 {
    init(_ affineTransform: CGAffineTransform) {
        self.init()
        m11 = Float(affineTransform.a)
        m12 = Float(affineTransform.b)
        m21 = Float(affineTransform.c)
        m22 = Float(affineTransform.d)
        m41 = Float(affineTransform.tx)
        m42 = Float(affineTransform.ty)
        m33 = 1
        m44 = 1
    }
}

extension SCNReferenceNode {
    convenience init(named resourceName: String, loadImmediately: Bool = true) {
        let url = Bundle.main.url(forResource: resourceName, withExtension: "scn", subdirectory: "Models.scnassets")!
        self.init(url: url)!
        
        if loadImmediately {
            self.load()
        }
    }
}
