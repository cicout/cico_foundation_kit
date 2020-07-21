//
//  UIColor+rgba.swift
//  CICOFoundationKit
//
//  Created by Ethan.Li on 2020/7/21.
//  Copyright © 2020 cico. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init(rgba: UInt32) {
        self.init(red: CGFloat((rgba&0xFF000000)>>24)/255.0,
                  green: CGFloat((rgba&0xFF0000)>>16)/255.0,
                  blue: CGFloat((rgba&0xFF00)>>8)/255.0,
                  alpha: CGFloat(rgba&0xFF)/255.0)
    }

    convenience init(rgb: UInt32, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat((rgb&0xFF0000)>>16)/255.0,
                  green: CGFloat((rgb&0xFF00)>>8)/255.0,
                  blue: CGFloat(rgb&0xFF)/255.0,
                  alpha: alpha)
    }
}
