//
//  GetFavouriteCitiesUseCase.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import Foundation

protocol GetFavouriteCitiesUseCaseProtocol {
    func execute() -> [Int]
}

struct GetFavouriteCitiesUseCase: GetFavouriteCitiesUseCaseProtocol {
    private let repository: CityRepositoryProtocol
    
    init(repository: CityRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> [Int] {
        repository.getFavouritesCities()
    }
}
