//
//  Bundle+bundle.swift
//  INSFoundationKit
//
//  Created by Ethan.Li on 2019/9/17.
//  Copyright © 2019 cico. All rights reserved.
//

import Foundation

public extension Bundle {
    convenience init(forObject object: AnyObject) {
        self.init(for: type(of: object))
    }
}
