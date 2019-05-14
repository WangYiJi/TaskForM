//
//  HoneycombLayer.swift
//  MProject
//
//  Created by 王义吉 on 2019/5/13.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
class HoneycombLayer:CAShapeLayer {
    
    static func honeycombLayer(sideLength:CGFloat) -> HoneycombLayer {
        let layer:HoneycombLayer = HoneycombLayer.init()
        let utilAngle:CGFloat = CGFloat(M_PI / 3)
        let path:UIBezierPath = UIBezierPath.init()
        path.move(to: CGPoint(x: cos(utilAngle * 0.5) * sideLength, y: sin(utilAngle * 0.5) * sideLength))
        
        path.addLine(to: CGPoint(x: cos(utilAngle * 1.5) * sideLength, y: sin(utilAngle * 1.5) * sideLength))
        path.addLine(to: CGPoint(x: cos(utilAngle * 2.5) * sideLength, y: sin(utilAngle * 2.5) * sideLength))
        path.addLine(to: CGPoint(x: cos(utilAngle * 3.5) * sideLength, y: sin(utilAngle * 3.5) * sideLength))
        path.addLine(to: CGPoint(x: cos(utilAngle * 4.5) * sideLength, y: sin(utilAngle * 4.5) * sideLength))
        path.addLine(to: CGPoint(x: cos(utilAngle * 5.5) * sideLength, y: sin(utilAngle * 5.5) * sideLength))
        
        layer.path = path.cgPath
        layer.fillColor = UIColor.orange.cgColor
        layer.bounds = CGRect(x: 0, y: 0, width: sideLength * 2, height: sin(utilAngle * 1) * sideLength * 2)

        return layer
    }
}
