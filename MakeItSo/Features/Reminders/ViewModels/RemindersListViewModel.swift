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
    
    func setCompleted(_ reminder: Reminder, isCompleted: Bool) {
        var editedReminder = reminder
        editedReminder.isCompleted = isCompleted
        updateReminder(editedReminder)
    }
    
    func updateReminder(_ reminder: Reminder) {
        do {
            try reminderRepository.updateReminder(reminder)
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteReminder(_ reminder: Reminder) {
        do {
            try reminderRepository.removeReminder(reminder)
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
}
