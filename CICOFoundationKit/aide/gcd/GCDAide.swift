//
//  GCDAide.swift
//  CICOFoundationKit
//
//  Created by Ethan.Li on 2019/5/31.
//  Copyright © 2019 cico. All rights reserved.
//

import Foundation

public class GCDAide {
    public static func syncOnMain(_ closure: (() -> Void)? = nil) {
        if Thread.current.isMainThread {
            closure?()
        } else {
            DispatchQueue.main.sync {
                closure?()
            }
        }
    }

    public static func asyncOnMain(_ closure: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            closure?()
        }
    }

    public static func asyncOnMain(after delayInS: Double, _ closure: (() -> Void)? = nil) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInS) {
            closure?()
        }
    }

    public static func syncOnGlobal(_ closure: (() -> Void)? = nil) {
        DispatchQueue.global().sync {
            closure?()
        }
    }

    public static func asyncOnGlobal(_ closure: (() -> Void)? = nil) {
        DispatchQueue.global().async {
            closure?()
        }
    }

    public static func asyncOnGlobal(after delayInS: Double, _ closure: (() -> Void)? = nil) {
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + delayInS) {
            closure?()
        }
    }

    public static func syncRunForAsyncClosure<T>(type: T.Type = T.self,
                                                 _ asyncClosure: @escaping (@escaping (T) -> Void) -> Void) -> T {
        var result: T?
        let semaphore = DispatchSemaphore.init(value: 0)
        self.asyncOnGlobal {
            asyncClosure({ (completionResult) in
                result = completionResult
                semaphore.signal()
            })
        }
        semaphore.wait()
        return result!
    }
}
