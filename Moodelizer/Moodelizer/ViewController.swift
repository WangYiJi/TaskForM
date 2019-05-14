//
//  ViewController.swift
//  MProject
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
                //be reversed.
                let pointy = (height - point.y) / height
                self?.dynamicDisplay(point: CGPoint(x: pointx, y: pointy))
            }
        }
    }
    func dynamicDisplay(point: CGPoint?) {
        if let poi = point {
            self.lblXCoordinate.text = String(format: "x-axis:%.2f", poi.x)
            self.lblYCoordinate.text = String(format: "y-axis:%.2f", poi.y)
            self.view.backgroundColor = RGBA(rCol: poi.x*255, gCol: poi.y*255, bCol: ((poi.x+poi.y)/2)*255, aCol: 1)
        } else {
            self.lblXCoordinate.text = ""
            self.lblYCoordinate.text = ""
            self.view.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func didpressed() {
        if UIApplication.shared.keyWindow?.isHidden ?? false {
            UIApplication.shared.keyWindow?.isHidden = false
        } else {
            UIApplication.shared.keyWindow?.isHidden = true
        }
    }
}
