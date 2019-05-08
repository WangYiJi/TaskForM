//
//  PadView.swift
//  Moodelizer
//
//  Created by 王义吉 on 2019/4/25.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
typealias DragEventCallback = (CGPoint) -> Void
class PadView: UIView {
    var dragEventCallback: DragEventCallback?
    let xLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let yLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var xLineAnchor: NSLayoutConstraint?
    var yLineAnchor: NSLayoutConstraint?
    var anchorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = kAnchorSize / 2
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    func setupUI() {
        //add anchor to view
        anchorView.frame = CGRect(x: 0, y: 0, width: kAnchorSize, height: kAnchorSize)
        self.addSubview(anchorView)
        //add pan gesture to anchorView
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(didPan(_:)))
        self.anchorView.addGestureRecognizer(panGesture)
        //add x y line to view
        self.addSubview(xLine)
        self.xLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.xLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.xLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        self.xLineAnchor = self.xLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50)
        self.xLineAnchor?.isActive = true
        self.addSubview(yLine)
        self.yLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.yLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.yLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.yLineAnchor = self.yLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 50)
        self.yLineAnchor?.isActive = true
        //setup origin point
        self.adjustAnchorPosition(point: CGPoint(x: 0, y: 0))
        self.backgroundColor = UIColor.clear
    }

}

//touch event
extension PadView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let pointInTouch = touches.first?.location(in: self) {
            let point = CGPoint(x: pointInTouch.x - kAnchorSize/2, y: pointInTouch.y - kAnchorSize/2)
            self.adjustAnchorPosition(point: point)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let pointInTouch = touches.first?.location(in: self) {
            let point = CGPoint(x: pointInTouch.x - kAnchorSize/2, y: pointInTouch.y - kAnchorSize/2)
            self.adjustAnchorPosition(point: point)
        }
    }
}

//pan gesture event
extension PadView {
    @objc fileprivate func didPan(_ panGesture: UIPanGestureRecognizer) {
        let pointInPan = panGesture.translation(in: panGesture.view)
        let point = CGPoint(x: self.anchorView.frame.origin.x + pointInPan.x,
                            y: self.anchorView.frame.origin.y + pointInPan.y)
        self.adjustAnchorPosition(point: point)
        //clear translation
        panGesture.setTranslation(CGPoint.zero, in: self.anchorView)
    }
}

//position adjust
extension PadView {
    func adjustAnchorPosition(point: CGPoint) {
        var originX = point.x
        var originY = point.y
        //kSpace currently is 0, set any other value could left some space with board.
        if originX < kSpace {
            originX = kSpace
        } else if originX > self.frame.size.width - kAnchorSize {
            originX = self.frame.size.width - kAnchorSize
        }
        if originY < kSpace {
            originY = kSpace
        } else if originY > self.frame.size.height - kAnchorSize {
            originY = self.frame.size.height - kAnchorSize
        }
        //adjust line position
        self.xLineAnchor?.constant = originX + kAnchorSize/2
        self.yLineAnchor?.constant = originY + kAnchorSize/2
        //adjust anchor view position
        self.anchorView.frame = CGRect.init(x: originX, y: originY, width: self.anchorView.bounds.width, height: self.anchorView.bounds.height)
        //callback to viewcontroller update x y info.
        if let block = self.dragEventCallback {
            block(CGPoint(x: originX, y: originY))
        }
    }
}
