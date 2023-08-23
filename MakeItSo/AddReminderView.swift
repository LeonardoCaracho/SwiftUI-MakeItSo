//
//  ReminderView.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 23/08/23.
//

import SwiftUI

struct AddReminderView: View {
    enum FocusableField: Hashable {
        case title
    }
    
    @FocusState
    private var focusedField: FocusableField?
    
    @State private var reminder = Reminder(title: "")
    
    var onCommit: (_ reminder: Reminder) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    private func cancel() {
        dismiss()
    }
    
    private func commit() {
        onCommit(reminder)
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $reminder.title)
                    .focused($focusedField, equals: .title)
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                        Text("Add")
                    }
                    .disabled(reminder.title.isEmpty)
                }
            }
            .onAppear {
                focusedField = .title
            }
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView { reminder in
            print("You added a new reminder titled \(reminder.title)")
        }
    }
}
