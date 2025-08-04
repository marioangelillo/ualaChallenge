//
//  CityUseCaseContainerMock.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 04/08/2025.
//

@testable import UalaChallenge

final class CityUseCaseContainerMock: CityUseCaseContainerProtocol {
    let getCityUseCase: GetCitiesUseCaseProtocol = GetCityUseCaseMock()
    let getFavoriteCitiesUseCase: GetFavouriteCitiesUseCaseProtocol = GetFavoriteCitiesUseCaseMock()
    let setFavoriteCityUseCase: SetFavouriteCitiesUseCaseProtocol = SetFavouriteCitiesUseCaseMock()
}

final class GetCityUseCaseMock: GetCitiesUseCaseProtocol {
    var citiesToReturn = CitiesMock.cities

    func execute() async throws -> [City] {
        return citiesToReturn
    }
}

final class GetFavoriteCitiesUseCaseMock: GetFavouriteCitiesUseCaseProtocol {
    var favoriteIdsToReturn: Set<Int> = [1,3]

    func execute() -> Set<Int> {
        return favoriteIdsToReturn
    }
}

final class SetFavouriteCitiesUseCaseMock: SetFavouriteCitiesUseCaseProtocol {
    var lastSavedFavorites: Set<Int> = []
    
    func execute(citiesId: Set<Int>) {
        lastSavedFavorites = citiesId
    }
}
