//
//  ChallengeM5L17App.swift
//  ChallengeM5L17
//
//  Created by Carlos Banza on 07/07/2021.
//

import SwiftUI

@main
struct ChallengeM5L17App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentModule())
        }
    }
}
