//
//  RemindersListViewModel.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 23/08/23.
//

import Foundation
import Combine

class RemindersListViewModel: ObservableObject {
    @Published var reminders = [Reminder]()

    @Published var errorMessage: String?
    
    private var reminderRepository: ReminderRepository = ReminderRepository()
    
    init() {
        reminderRepository
            .$reminders
            .assign(to: &$reminders)
    }
    
    func addReminder(_ reminder: Reminder) {
        do {
            try reminderRepository.addReminders(reminder)
            errorMessage = nil
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func toggleCompleted(_ reminder: Reminder) {
        if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminders[index].isCompleted.toggle()
        }
    }
}
