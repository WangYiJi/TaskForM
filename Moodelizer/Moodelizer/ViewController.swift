//
//  ViewController.swift
//  Moodelizer
//
//  Created by 王义吉 on 2019/4/24.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var padView: PadView!
    @IBOutlet weak var lblXCoordinate: UILabel!
    @IBOutlet weak var lblYCoordinate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindTouchEvent()
    }
    
    func setupUI () {
        padView.layer.borderWidth = 1
        padView.layer.borderColor = UIColor.black.cgColor
        
        lblXCoordinate.layer.cornerRadius = 10
        lblXCoordinate.layer.masksToBounds = true
        
        lblYCoordinate.layer.cornerRadius = 10
        lblYCoordinate.layer.masksToBounds = true
        
        dynamicDisplay(point: CGPoint(x: 0, y: 1))
    }
    
    //setup background color when drag event callback
    func bindTouchEvent() {
        padView.dragEventCallback = { [weak self] (point) in
            
            if let padWidth = self?.padView.frame.size.width, let padHeight = self?.padView.frame.size.height {
                let width = padWidth - kAnchorSize
                let height = padHeight - kAnchorSize
                
                let pointx = point.x / width
                
                //The ios coordinate system is different from the traditional mathematical coordinate system, so it needs to be reversed.
                let pointy = (height - point.y) / height
            
                self?.dynamicDisplay(point: CGPoint(x: pointx, y: pointy))
            }
        }
    }
    
    func dynamicDisplay(point:CGPoint?) {
        if let p = point {
            self.lblXCoordinate.text = String(format: "x-axis:%.2f", p.x)
            self.lblYCoordinate.text = String(format: "y-axis:%.2f", p.y)
            
            self.view.backgroundColor = RGBA(r: p.x*255, g: p.y*255, b: ((p.x+p.y)/2)*255, a: 1)
        } else {
            self.lblXCoordinate.text = ""
            self.lblYCoordinate.text = ""
            self.view.backgroundColor = UIColor.lightGray
        }
    }
    
}

