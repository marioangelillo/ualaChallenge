//
//  CitiesListViewModel.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI

protocol CitiesListViewModelProtocol: ObservableObject {
    var cities: [City] { get set }
    var filteredCities: [City] { get set }
    var isLoading: Bool { get set }
    var textInput: String { get set }
    var favouriteFilterToggle: Bool { get set }
    var selectedCity: City? { get set }
    var cityUseCases: CityUseCaseContainerProtocol { get }
    func fetchCities() async
    func filterByTextInput()
    func toggleFavouritesTapped()
    func favouriteIconTapped(_ cityId: Int, _ isFavorite: Bool)
}

final class CitiesListViewModel: CitiesListViewModelProtocol {
    @Published var cities: [City] = []
    @Published var filteredCities: [City] = []
    @Published var favoritesCities: [Int] = []
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
            favoritesCities = cityUseCases.getFavoriteCitiesUseCase.execute()
            cities = try await cityUseCases.getCityUseCase.execute()
            filteredCities = cities
            
            if favouriteFilterToggle {
                filterOnlyFavorites()
            }
        } catch {
            print("API error")
        }
    }
    
    func filterByTextInput() {
        if textInput.isEmpty {
            filteredCities = cities
        } else {
            filteredCities = cities.filter { $0.cityDetailTitle.lowercased().contains(textInput.lowercased()) }
        }
        
        if favouriteFilterToggle {
            filterOnlyFavorites()
        }
    }
    
    func toggleFavouritesTapped() {
        favouriteFilterToggle.toggle()
        if favouriteFilterToggle {
            filterOnlyFavorites()
        } else {
            filterByTextInput()
        }
    }
    
    func favouriteIconTapped(_ cityId: Int, _ isFavorite: Bool) {
        if isFavorite {
            favoritesCities.removeAll { $0 == cityId }
        } else {
            favoritesCities.insert(cityId, at: 0)
        }
        
        cityUseCases.setFavoriteCityUseCase.execute(citiesId: favoritesCities)
    }
    
    func isFavorite(_ cityId: Int) -> Bool {
        favoritesCities.contains(cityId)
    }
    
    private func filterOnlyFavorites() {
        filteredCities = filteredCities.filter({ favoritesCities.contains($0.id) })
    }
}
