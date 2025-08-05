//
//  CitiesListViewModelTests.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 04/08/2025.
//

import XCTest
@testable import UalaChallenge

final class CitiesListViewModelTests: XCTestCase {
    var viewModel: CitiesListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CitiesListViewModel(cityUseCases: CityUseCaseContainerMock())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func test_fetchCities_shouldPopulateCitiesCorrectly() async {
        // Arrange
        let expectedCities = CitiesMock.cities
        
        // Act
        await viewModel.fetchCities()
        
        // Assert
        XCTAssertEqual(viewModel.cities, expectedCities)
        XCTAssertEqual(viewModel.filteredCities, expectedCities)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func test_toggleFavorites_shouldShowOnlyFavoriteCities() async {
        // Arrange
        let allCities = CitiesMock.cities
        let favoriteIds: Set<Int> = [1, 3]
        await viewModel.fetchCities()

        // Act
        viewModel.favouriteFilterToggle = true
        viewModel.toggleFavouritesTapped()

        // Assert
        let expectedFiltered = allCities.filter { favoriteIds.contains($0.id) }
        XCTAssertEqual(viewModel.filteredCities, expectedFiltered)
    }
    
    func test_filterByTextInput_shouldShowOnlyCitiesThatContainText() {
        // Arrange
        viewModel.cities = CitiesMock.cities
        viewModel.filteredCities = CitiesMock.cities
        viewModel.textInput = "San"
        
        // Act
        viewModel.filterByTextInput()

        // Assert
        XCTAssertEqual(viewModel.filteredCities.count, 3)
        XCTAssertTrue(
            viewModel.filteredCities.allSatisfy { $0.cityDetailTitle.localizedCaseInsensitiveContains("San") },
            "Todas las ciudades filtradas deben contener el texto 'San'"
        )
    }
    
    func test_filterByTextInput_shouldShowOnlyFavoriteCitiesThatContainText() {
        // Arrange
        viewModel.cities = CitiesMock.cities
        viewModel.filteredCities = CitiesMock.cities
        viewModel.favoriteCityIds = [0, 2, 6]
        viewModel.textInput = "San"
        viewModel.favouriteFilterToggle = true

        // Act
        viewModel.filterByTextInput()

        // Assert
        let expected = [
            CitiesMock.cities[0], // San Miguel de Tucuman (id: 0)
            CitiesMock.cities[2], // Santa Fe (id: 2)
            CitiesMock.cities[6]  // San Rafael (id: 6)
        ].filter { $0.cityDetailTitle.localizedCaseInsensitiveContains("San") }

        XCTAssertEqual(viewModel.filteredCities, expected)
    }
    
    func test_isFavorite_shouldReturnTrueIfCityIsFavorite() {
        // Arrange
        viewModel.favoriteCityIds = [0, 2, 6]
        
        // Act
        let isFavorite0 = viewModel.isFavorite(0)
        let isFavorite1 = viewModel.isFavorite(1)
        let isFavorite2 = viewModel.isFavorite(2)
        
        // Assert
        XCTAssertTrue(isFavorite0)
        XCTAssertFalse(isFavorite1)
        XCTAssertTrue(isFavorite2)
    }
}
