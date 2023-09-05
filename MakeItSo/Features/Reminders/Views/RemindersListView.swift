//
//  ContentView.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 23/08/23.
//

import SwiftUI

struct RemindersListView: View {
    @State private var isAddReminderDialogPresented = false
    
    @StateObject var viewModel = RemindersListViewModel()
    
    @State private var editableReminder: Reminder? = nil
    
    @State private var showSettings: Bool = false
    
    private func presentAddReminderView() {
        isAddReminderDialogPresented.toggle()
    }
    
    private func presentSettings() {
        showSettings.toggle()
    }
        
    var body: some View {
        List($viewModel.reminders) { $reminder in
            RemindersListRowView(reminder: $reminder)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        viewModel.deleteReminder(reminder)
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(Color(UIColor.systemRed))
                }
                .onChange(of: reminder.isCompleted) { newValue in
                    viewModel.setCompleted(reminder, isCompleted: newValue)
                }
                .onTapGesture {
                    editableReminder = reminder
                }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    presentSettings()
                } label: {
                    Image(systemName: "gearshape")
                }
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: presentAddReminderView) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isAddReminderDialogPresented) {
            EditReminderDetailsView { reminder in
                viewModel.addReminder(reminder)
            }
        }
        .sheet(item: $editableReminder, content: { reminder in
            EditReminderDetailsView(mode: .edit, reminder: reminder) { reminder in
                viewModel.updateReminder(reminder)
            }
        })
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .tint(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RemindersListView()
                .navigationTitle("Reminders")
        }
    }
}
