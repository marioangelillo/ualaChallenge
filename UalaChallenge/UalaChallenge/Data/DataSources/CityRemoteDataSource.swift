//
//  CityAPIService.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import Foundation

protocol CityRemoteDataSourceProtocol {
    func fetchCities() async throws -> [CityDTO]
}

final class CityRemoteDataSource: CityRemoteDataSourceProtocol {
    let baseUrl = "https://gist.githubusercontent.com/"
    
    func fetchCities() async throws -> [CityDTO] {
        let path = "hernan-uala/dce8843a8edbe0b0018b32e137bc2b3a/raw/0996accf70cb0ca0e16f9a99e0ee185fafca7af1/cities.json"
        
        guard let url = URL(string: baseUrl + path) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        let cities = try JSONDecoder().decode([CityDTO].self, from: data)
        return cities
    }
}
