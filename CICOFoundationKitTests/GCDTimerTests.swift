//
//  GCDTimerTests.swift
//  CICOFoundationKitTests
//
//  Created by Ethan.Li on 2020/7/17.
//  Copyright © 2020 cico. All rights reserved.
//

import XCTest
import CICOFoundationKit

class GCDTimerTests: XCTestCase {
    var timer: GCDTimer?
    
    func test_repeat_timer() {
        self.timer = GCDTimer.init(globalTimerInterval: 1, repeats: true) {
            print("time = \(Date.init())")
        }
        XCTAssertNotNil(self.timer)
    }
}
