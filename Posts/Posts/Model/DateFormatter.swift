//
//  DateFormatter.swift
//  Posts
//
//  Created by Andrey Boyko on 24.07.2022.
//

import Foundation

extension Date {
    func timeAgoDisplay(time: Int?) -> String {
        if let time = time {
            let date1 = Date(timeIntervalSince1970: TimeInterval(time))
            let date2 = Date()
            let dateDiff = Calendar.current.dateComponents([.day], from: date1, to: date2).day
            return "\(dateDiff ?? 0) days ago"
        }
        else {
            return ""
        }
    }
}
