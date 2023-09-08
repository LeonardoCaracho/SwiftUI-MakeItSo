//
//  ListRowView.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 28/08/23.
//

import SwiftUI

struct RemindersListRowView: View {
    @Binding var reminder: Reminder
    
    var body: some View {
        HStack {
            Toggle(isOn: $reminder.isCompleted) {}
            Text(reminder.title)
            Spacer()
        }
        .contentShape(Rectangle())
        .toggleStyle(ReminderToggleStyle())
    }
}

struct RemindersListRowView_Previews: PreviewProvider {
    struct Container: View {
        @State var reminder = Reminder.samples[0]
        @State var reminder1 = Reminder.samples[1]
        @State var reminder2 = Reminder.samples[2]
        
        var body: some View {
            List {
                RemindersListRowView(reminder: $reminder)
                RemindersListRowView(reminder: $reminder1)
                RemindersListRowView(reminder: $reminder2)
            }
        }
    }
    
    static var previews: some View {
        NavigationView {
            Container()
                .navigationTitle("Reminders")
        }
    }
}
