//
//  UalaChallengeApp.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 02/08/2025.
//

import SwiftUI

@main
struct UalaChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CitiesListView(viewModel: CitiesViewModelFactory.make())
            }
        }
    }
}
