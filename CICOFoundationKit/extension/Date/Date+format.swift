//
//  Date+format.swift
//  CICOFoundationKit
//
//  Created by Ethan.Li on 2020/7/21.
//  Copyright © 2020 cico. All rights reserved.
//

import Foundation

public extension Date {
    static func dateFromString(dateString: String, format: String, timeZone: TimeZone? = nil) -> Date? {
        let formatter = DateFormatter.init(format: format, timeZone: timeZone)
        return formatter.date(from: dateString)
    }

    func dateString(format: String, timeZone: TimeZone? = nil) -> String {
        let formatter = DateFormatter.init(format: format, timeZone: timeZone)
        return formatter.string(from: self)
    }
}
