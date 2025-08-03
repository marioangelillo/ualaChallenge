//
//  CitiesLocalData.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import Foundation

protocol CityLocalDataSourceProtocol {
    func getFavouriteCities() -> [Int]
    func setFavouriteCities(citiesId: [Int])
}

final class CityLocalDataSource: CityLocalDataSourceProtocol {
    func getFavouriteCities() -> [Int] {
        return []
    }
    
    func setFavouriteCities(citiesId: [Int]) {
        print(citiesId)
    }
}
