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
    var timer: GCDTimer?
    
    func test() {
        print("start = \(Date.init())")
        
        self.timer = GCDTimer.init(globalTimerInterval: 1, repeats: true) {
            print("time = \(Date.init())")
        }
    }
}
