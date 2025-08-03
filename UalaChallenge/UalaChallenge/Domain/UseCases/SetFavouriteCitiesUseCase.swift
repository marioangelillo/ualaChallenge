//
//  SetFavouriteCities.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

protocol SetFavouriteCitiesUseCaseProtocol {
    func execute(citiesId: [Int])
}

struct SetFavouriteCitiesUseCase: SetFavouriteCitiesUseCaseProtocol {
    private let repository: CityRepositoryProtocol
    
    init(repository: CityRepositoryProtocol) {
        self.repository = repository
    }

    func execute(citiesId: [Int]) {
        repository.setFavouriteCities(cities: citiesId)
    }
}
