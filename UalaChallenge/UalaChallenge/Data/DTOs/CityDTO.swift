//
//  CityDTO.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

struct CityDTO: Decodable {
    let id: Int
    let name: String
    let country: String
    let coord: CoordinateDTO

    struct CoordinateDTO: Codable {
        let lon: Double
        let lat: Double
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case country
        case coord
    }

    func toDomain() -> City {
        return City(
            id: id,
            name: name,
            country: country,
            coordinate: .init(lat: coord.lat, lon: coord.lon)
        )
    }
}

