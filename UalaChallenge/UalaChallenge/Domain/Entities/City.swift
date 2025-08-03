//
//  City.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

struct City: Identifiable, Equatable {
    let id: Int
    let name: String
    let country: String
    let coordinate: Coordinate

    struct Coordinate: Equatable {
        let lat: Double
        let lon: Double
    }
}

