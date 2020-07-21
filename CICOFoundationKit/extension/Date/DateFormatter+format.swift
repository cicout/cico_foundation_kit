//
//  DateFormatter+format.swift
//  CICOFoundationKit
//
//  Created by Ethan.Li on 2020/7/21.
//  Copyright © 2020 cico. All rights reserved.
//

import Foundation

public extension DateFormatter {
    convenience init(format: String, timeZone: TimeZone? = nil) {
        self.init()
        self.dateFormat = format
        if let timeZone = timeZone {
            self.timeZone = timeZone
        }
    }
}
