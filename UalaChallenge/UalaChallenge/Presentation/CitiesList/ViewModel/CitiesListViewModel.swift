//
//  CitiesListViewModel.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI

final class CitiesListViewModel: ObservableObject {
    @Published var cities: [City] = [
        .init(id: 1, name: "Mock 1", country: "Argentina", coordinate: .init(lat: 34.0, lon: 44.1)),
        .init(id: 2, name: "Mock 2", country: "Argentina", coordinate: .init(lat: 1.0, lon: 1.1)),
        .init(id: 3, name: "Mock 3", country: "Argentina", coordinate: .init(lat: 1.0, lon: 1.1)),
        .init(id: 4, name: "Mock 4", country: "Argentina", coordinate: .init(lat: 1.0, lon: 1.1))
    ]
    
    @Published var isLoading: Bool = false
    @Published var textInput: String = ""
    @Published var favouriteFilterToggle = false
    @Published var selectedCity: City?
    
    func applyFilters() {
        print("text changed")
    }
    
    func toggleFavouritesTapped() {
        favouriteFilterToggle.toggle()
    }
    
    func favouriteIconTapped(_ cityId: Int) {
        if cities.contains(where: { $0.id == cityId }) {
            print("delete from favourites")
        } else {
            print("add to favourites")
        }
    }
}
