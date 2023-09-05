//
//  AuthenticationService+Injection.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 05/09/23.
//

import Foundation
import Factory

extension Container {
    public var authenticationService: Factory<AuthenticationService> {
        Factory(self) {
            AuthenticationService()
        }
        .singleton
    }
}
