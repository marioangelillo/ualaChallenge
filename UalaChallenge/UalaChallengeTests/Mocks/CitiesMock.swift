//
//  CitiesMock.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 04/08/2025.
//

@testable import UalaChallenge

struct CitiesMock {
    static let cities: [City] = [
        .init(id: 0, name: "San Miguel de Tucuman", country: "Argentina", coordinate: .init(lat: 1.0, lon: 2.0)),
        .init(id: 1, name: "Buenos Aires", country: "Argentina", coordinate: .init(lat: 10.0, lon: 20.0)),
        .init(id: 2, name: "Santa Fe", country: "Argentina", coordinate: .init(lat: 100.0, lon: 200.0)),
        .init(id: 3, name: "Cordoba", country: "Argentina", coordinate: .init(lat: 11.0, lon: 22.0)),
        .init(id: 4, name: "Jujuy", country: "Argentina", coordinate: .init(lat: 110.0, lon: 220.0)),
        .init(id: 5, name: "Chaco", country: "Argentina", coordinate: .init(lat: 16.0, lon: 22.0)),
        .init(id: 6, name: "San Rafael", country: "Argentina", coordinate: .init(lat: 16.0, lon: 22.0)),
    ]
}
