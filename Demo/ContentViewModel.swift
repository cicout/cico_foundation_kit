//
//  ContentViewModel.swift
//  Demo
//
//  Created by Ethan.Li on 2020/7/17.
//  Copyright © 2020 cico. All rights reserved.
//

import Foundation
import Combine
import CICOFoundationKit

class ContentViewModel: ObservableObject {
    var repeatTimer: GCDTimer?
    var noRepeatTimer: GCDTimer?

    func test() {
        print("start = \(Date.init())")

        self.repeatTimer = GCDTimer.init(globalTimerInterval: 1, repeats: true) {
            print("Repeat time = \(Date.init())")
        }

        self.noRepeatTimer = GCDTimer.init(globalTimerInterval: 1, repeats: false) {
            print("No repeat time = \(Date.init())")
        }
    }
}
