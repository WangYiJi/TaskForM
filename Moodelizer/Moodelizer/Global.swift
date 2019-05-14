//
//  Global.swift
//  MProject
//
//  Created by 王义吉 on 2019/4/25.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kStatusHeight = UIApplication.shared.statusBarFrame.size.height

func RGBA(rCol: CGFloat, gCol: CGFloat, bCol: CGFloat, aCol: CGFloat) -> UIColor {
    return UIColor(red: rCol/255, green: gCol/255, blue: bCol/255, alpha: aCol)
}

let kAnchorSize: CGFloat = 40
let kSpace: CGFloat = 0
