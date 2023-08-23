//
//  Reminder.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 23/08/23.
//

import Foundation

struct Reminder: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}

extension Reminder {
    static let samples = [
        Reminder(title: "Build sample App", isCompleted: true),
        Reminder(title: "Create tutorial"),
        Reminder(title: "???"),
        Reminder(title: "PROFIT!"),
    ]
}
