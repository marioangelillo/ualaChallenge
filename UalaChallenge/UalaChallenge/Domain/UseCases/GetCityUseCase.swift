//
//  GetCityUseCase.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import Foundation

protocol GetCitiesUseCaseProtocol {
    func execute() async throws -> [City]
}

struct GetCitiesUseCase: GetCitiesUseCaseProtocol {
    private let repository: CityRepositoryProtocol
    
    init(repository: CityRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [City] {
        try await repository.fetchCities().map({ $0.toDomain() })
    }
}
