//
//  UIApplication+topViewController.swift
//  INSFoundationKit
//
//  Created by Ethan.Li on 2019/12/13.
//  Copyright © 2019 cico. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    static var currentTopViewController: UIViewController {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else {
            assertionFailure("Invalid root vc.")
            return UIViewController.init()
        }
        var topPresentedVC = rootVC
        while let presentedVC = topPresentedVC.presentedViewController {
            topPresentedVC = presentedVC
        }
        var topVC = topPresentedVC
        if let tabVC = topVC as? UITabBarController, let selectedVC = tabVC.selectedViewController {
            topVC = selectedVC
        }
        if let navVC = topVC as? UINavigationController, let topNavVC = navVC.topViewController {
            topVC = topNavVC
        }
        return topVC
    }
}
