//
//  CitiesListViewModel.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI

protocol CitiesListViewModelProtocol: ObservableObject {
    var cities: [City] { get set }
    var isLoading: Bool { get set }
    var textInput: String { get set}
    var favouriteFilterToggle: Bool { get set }
    var selectedCity: City? { get set }
    var cityUseCases: CityUseCaseContainerProtocol { get }
    func fetchCities() async
    func applyFilters()
    func toggleFavouritesTapped()
    func favouriteIconTapped(_ cityId: Int)
}

final class CitiesListViewModel: CitiesListViewModelProtocol {
    @Published var cities: [City] = []
    @Published var favoritesCities: [City] = []
    @Published var isLoading: Bool = true
    @Published var textInput: String = ""
    @Published var favouriteFilterToggle = false
    @Published var selectedCity: City?
    
    let cityUseCases: CityUseCaseContainerProtocol
    
    init(cityUseCases: CityUseCaseContainerProtocol) {
        self.cityUseCases = cityUseCases
        
        Task { await fetchCities() }
    }
    
    @MainActor
    func fetchCities() async {
        isLoading = true
        defer { isLoading = false }
    
        do {
            self.cities = try await cityUseCases.getCityUseCase.execute()
        } catch {
            print("API error")
        }
    }
    
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
