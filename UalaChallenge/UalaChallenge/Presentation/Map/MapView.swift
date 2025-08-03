//
//  MapView.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Binding var selectedCity: City?
    let defaultCoordinates = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    
    var body: some View {
        Map {
            if let selectedCity {
                Marker(selectedCity.name, coordinate: selectedCity.cityCoordinates)
            } else {
                Marker("Map", coordinate: defaultCoordinates)
            }
        }
    }
}
