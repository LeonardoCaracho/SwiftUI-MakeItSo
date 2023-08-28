//
//  ReminderToggleStyle.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 28/08/23.
//

import SwiftUI

struct ReminderToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn
                  ? "largecircle.fill.circle"
                  : "circle")
            .imageScale(.large)
            .foregroundColor(configuration.isOn ? .accentColor : .gray)
            .onTapGesture {
                configuration.isOn.toggle()
            }
            configuration.label
        }
    }
}

struct ReminderToggleStyle_Previews: PreviewProvider {
    struct Container: View {
        @State var isOn = false
        var body: some View {
            Toggle(isOn: $isOn) {
                Text("Hello")
            }
            .toggleStyle(ReminderToggleStyle())
        }
    }
    
    static var previews: some View {
        Container()
    }
}
