//
//  Global.swift
//  Moodelizer
//
//  Created by 王义吉 on 2019/4/25.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit


let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kStatusHeight = UIApplication.shared.statusBarFrame.size.height

func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) ->UIColor {
    return UIColor(red:r/255, green:g/255, blue:b/255, alpha:a)
}

let kAnchorSize: CGFloat = 40
let kSpace:CGFloat = 0
