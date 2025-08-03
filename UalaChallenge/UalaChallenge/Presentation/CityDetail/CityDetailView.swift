//
//  CityDetailView.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI

struct CityDetailView: View {
    let city: City
    
    var body: some View {
        VStack {
            Text(city.name)
            Text(city.country)
            Text("latitude: \(city.coordinate.lat)")
            Text("longitude: \(city.coordinate.lon)")
        }
    }
}
