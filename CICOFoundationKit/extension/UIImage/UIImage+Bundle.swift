//
//  UIImage+Bundle.swift
//  INSFoundationKit
//
//  Created by Ethan.Li on 2018/8/1.
//  Copyright © 2018 cico. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    convenience init?(named: String, bundleForObject object: AnyObject) {
        self.init(named: named, bundleForClass: type(of: object))
    }
    
    convenience init?(named: String, bundleForClass aClass: Swift.AnyClass) {
        let bundle = Bundle.init(for: aClass)
        self.init(named: named, in: bundle, compatibleWith: nil)
    }
}
