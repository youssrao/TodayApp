//
//  ReminderListStyle.swift
//  Today
//
//  Created by Youssra Outelli on 19/03/2022.
//

import Foundation

//style enum for filtering reminders
enum ReminderListStyle: Int {
    case today
    case future
    case all

    func shouldInclude(date: Date) -> Bool {
        let isInToday = Locale.current.calendar.isDateInToday(date)
        switch self {
        case .today:
            return isInToday
        case .future:
            return (date > Date.now) && !isInToday
        case .all:
            return true
        }
    }
}

