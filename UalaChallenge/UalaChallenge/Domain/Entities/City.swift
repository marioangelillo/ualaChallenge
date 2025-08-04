//
//  City.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import MapKit

struct City: Identifiable, Equatable {
    let id: Int
    let name: String
    let country: String
    let coordinate: Coordinate
    
    var cityDetailTitle: String {
        name + ", " + country
    }
    
    var cityDetailSubtitle: String {
        "lat: \(coordinate.lat), long: \(coordinate.lon)"
    }
    
    var cityCoordinates: CLLocationCoordinate2D {
      CLLocationCoordinate2D(latitude: coordinate.lat, longitude: coordinate.lon)
    }

    struct Coordinate: Equatable {
        let lat: Double
        let lon: Double
    }
}
