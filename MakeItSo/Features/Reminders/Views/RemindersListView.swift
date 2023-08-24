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
    
    private func presentAddReminderView() {
        isAddReminderDialogPresented.toggle()
    }
        
    var body: some View {
        List($viewModel.reminders) { $reminder in
            HStack {
                Image(systemName: reminder.isCompleted
                      ? "largecircle.fill.circle"
                      : "circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        viewModel.toggleCompleted(reminder)
                    }
                Text(reminder.title)
            }
        }
        .toolbar {
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
            AddReminderView { reminder in
                viewModel.addReminder(reminder)
            }
        }
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
