//
//  CityRepositoryImpl.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

protocol CityRepositoryProtocol {
    func fetchCities() async throws -> [CityDTO]
    func getFavouritesCities() -> Set<Int>
    func setFavouriteCities(cities: Set<Int>)
}

struct CityRepository: CityRepositoryProtocol {
    private let localDataSource: CityLocalDataSourceProtocol
    private let remoteDataSource: CityRemoteDataSourceProtocol
    
    init(localDataSource: CityLocalDataSourceProtocol, remoteDataSource: CityRemoteDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchCities() async throws -> [CityDTO] {
        try await remoteDataSource.fetchCities()
    }
    
    func getFavouritesCities() -> Set<Int> {
        localDataSource.getFavouriteCities()
    }
    
    func setFavouriteCities(cities: Set<Int>) {
        localDataSource.setFavouriteCities(citiesId: cities)
    }
}

