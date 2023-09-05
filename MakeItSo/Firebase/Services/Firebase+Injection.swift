//
//  Firebase+Injection.swift
//  MakeItSo
//
//  Created by Leonardo Caracho on 04/09/23.
//

import Foundation
import Factory
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

extension Container {
    public var useEmulator: Factory<Bool> {
        Factory(self) {
            let value = UserDefaults.standard.bool(forKey: "useEmulator")
            print("Using the emulator: \(value == true ? "YES" : "NO")")
            return value
        }
        .singleton
    }
    
    public var firestore: Factory<Firestore> {
        Factory(self) {
            var env = ""
            if Container.shared.useEmulator() {
                let settings = Firestore.firestore().settings
                settings.host = "localhost:8080"
                settings.cacheSettings = MemoryCacheSettings()
                settings.isSSLEnabled = false
                
                env = "to use the local emulator on \(settings.host)"
                
                Firestore.firestore().settings = settings
                Auth.auth().useEmulator(withHost: "localhost", port: 9099)
            } else {
                env = "to use the firebase backend"
            }
            
            print("Configuring Cloud Firestore \(env).")
            return Firestore.firestore()
        }
        .singleton
    }
    
    public var auth: Factory<Auth> {
        Factory(self) {
            var env = ""
            if Container.shared.useEmulator() {
                let host = "localhost"
                let port = 9099
                env = "to use the local emulator on \(host):\(port)"
                Auth.auth().useEmulator(withHost: host, port: port)
            } else {
                env = "to use firebase backend"
            }
            print("Configuring Firebase Auth \(env)")
            return Auth.auth()
        }
        .singleton
    }
}
