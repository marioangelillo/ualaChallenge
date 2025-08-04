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

struct CityLocalDataSource: CityLocalDataSourceProtocol {
    private let FAVORITE_CITIES_KEY = "favorite_cities"
    
    func getFavouriteCities() -> Set<Int> {
        let favCitiesArray = UserDefaults.standard.array(forKey: FAVORITE_CITIES_KEY) as? [Int] ?? []
        let favCitiesSet = Set(favCitiesArray)
        return favCitiesSet
    }
    
    func setFavouriteCities(citiesId: Set<Int>) {
        let favCitiesArray = Array(citiesId)
        UserDefaults.standard.setValue(favCitiesArray, forKey: FAVORITE_CITIES_KEY)
    }
}
