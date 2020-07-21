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
    static var topPresentedViewController: UIViewController {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else {
            assertionFailure("Invalid root vc.")
            return UIViewController.init()
        }
        var topPresentedVC = rootVC
        while let presentedVC = topPresentedVC.presentedViewController {
            topPresentedVC = presentedVC
        }
        return topPresentedVC
    }

    static var currentTopViewController: UIViewController {
        var topVC = self.topPresentedViewController

        while true {
            if let tabVC = topVC as? UITabBarController, let selectedVC = tabVC.selectedViewController {
                topVC = selectedVC
                continue
            } else if let navVC = topVC as? UINavigationController, let topNavVC = navVC.topViewController {
                topVC = topNavVC
                continue
            } else {
                break
            }
        }

        return topVC
    }

    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        Self.topPresentedViewController.present(viewController, animated: animated, completion: completion)
    }
}
