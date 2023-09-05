//
//  Reminder.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 23/08/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Reminder: Identifiable, Codable {
    @DocumentID
    var id: String?
    var title: String
    var isCompleted = false
    var userId: String? = nil
}

extension Reminder {
    static let samples = [
        Reminder(title: "Build sample App", isCompleted: true),
        Reminder(title: "Create tutorial"),
        Reminder(title: "???"),
        Reminder(title: "PROFIT!"),
    ]
}

extension Reminder {
    static let collectionName: String = "Reminders"
}
