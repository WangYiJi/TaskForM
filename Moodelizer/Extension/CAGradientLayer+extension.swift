//
//  CAGradientLayer+extension.swift
//  Moodelizer
//
//  Created by 王义吉 on 2019/5/8.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func rainbowLayer(point: CGPoint) -> CAGradientLayer {
        //define rainbow colours
        let gradientColors = [UIColor.red.cgColor,
                              UIColor.orange.cgColor,
                              UIColor.yellow.cgColor,
                              UIColor.green.cgColor,
                              UIColor.cyan.cgColor,
                              UIColor.blue.cgColor,
                              UIColor.purple.cgColor]
        
        //define each color position
        let gradientLocations:[NSNumber] = [0.0, 0.17, 0.33, 0.5, 0.67, 0.83, 1.0]
        
        //create CAGradientLayer and setup
        self.colors = gradientColors
        self.locations = gradientLocations
        
        //setup begin end postion
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = point//CGPoint(x: 1, y: 0)
        
        return self
    }
}
