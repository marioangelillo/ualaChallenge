//
//  CitiesLocalData.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import Foundation

protocol CityLocalDataSourceProtocol {
    func getFavouriteCities() -> Set<Int>
    func setFavouriteCities(citiesId: Set<Int>)
}

final class CityLocalDataSource: CityLocalDataSourceProtocol {
    func getFavouriteCities() -> Set<Int> {
        return []
    }
    
    func setFavouriteCities(citiesId: Set<Int>) {
        print(citiesId)
    }
}
