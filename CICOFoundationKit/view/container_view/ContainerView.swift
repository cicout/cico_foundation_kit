//
//  INSHolderView.swift
//  CICOFoundationKit
//
//  Created by Ethan.Li on 05/02/2018.
//  Copyright © 2018 cico. All rights reserved.
//

import UIKit

open class ContainerView: UIView {
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view == self {
            return nil
        } else {
            return view
        }
    }
}
