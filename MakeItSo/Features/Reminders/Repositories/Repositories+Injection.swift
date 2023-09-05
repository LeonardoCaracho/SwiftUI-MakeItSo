//
//  Repositories+Injection.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 04/09/23.
//

import Foundation
import Factory

extension Container {
    var remindersRepository: Factory<ReminderRepository> {
        Factory(self) {
            return ReminderRepository()
        }
        .singleton
    }
}
