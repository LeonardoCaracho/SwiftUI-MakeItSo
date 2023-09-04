//
//  ReminderView.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 23/08/23.
//

import SwiftUI

struct EditReminderDetailsView: View {
    enum FocusableField: Hashable {
        case title
    }
    
    enum Mode {
        case edit
        case add
    }
    
    var mode: Mode = .add
    
    @FocusState private var focusedField: FocusableField?
    
    @State var reminder = Reminder(title: "")
    
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
                    .onSubmit {
                        commit()
                    }
            }
            .navigationTitle(mode == .add ? "New Reminder" : "Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                        Text(mode == .add ? "Add" : "Done")
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

struct EditReminderDetailsView_Previews: PreviewProvider {
    struct Container: View {
        @State var reminder = Reminder.samples[0]
        var body: some View {
            EditReminderDetailsView(mode: .edit, reminder: reminder) { reminder in
                print("you edited a reminder \(reminder.title)")
            }
        }
    }
    
    
    static var previews: some View {
        EditReminderDetailsView { reminder in
            print("You added a new reminder titled \(reminder.title)")
        }
        Container()
    }
}
