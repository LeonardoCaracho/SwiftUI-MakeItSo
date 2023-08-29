//
//  ReminderRepository.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 28/08/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ReminderRepository: ObservableObject {
    @Published var reminders = [Reminder]()
    
    func addReminders(_ reminder: Reminder) throws {
        try Firestore
            .firestore()
            .collection("reminders")
            .addDocument(from: reminder)
    }
}
