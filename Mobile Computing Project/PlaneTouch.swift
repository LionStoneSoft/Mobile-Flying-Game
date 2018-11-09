//
//  PlaneTouch.swift
//  Mobile Computing Project
//
//  Created by Ryan Soanes on 09/11/2018.
//  Copyright © 2018 Ryan Soanes. All rights reserved.
//

import UIKit

class PlaneTouch: UIImageView {

    var startLocation: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        let boundaries = (self.superview?.bounds)!
        
        let boundaryCenter = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        
        if boundaries.contains(boundaryCenter) {
            self.center = boundaryCenter
        }
        
    }

}
