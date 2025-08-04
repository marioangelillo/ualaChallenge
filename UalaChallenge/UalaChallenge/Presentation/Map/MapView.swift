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
    @State private var position: MapCameraPosition = .automatic
    
    private let defaultCoordinates = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    private let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)

    var body: some View {
        Map(position: $position) {
            Marker(markerTitle, coordinate: currentCoordinate)
        }
        .onAppear(perform: updatePosition)
        .onChange(of: selectedCity) { _, _ in
            updatePosition()
        }
    }
    
    private var currentCoordinate: CLLocationCoordinate2D {
        selectedCity?.cityCoordinates ?? defaultCoordinates
    }
    
    private var markerTitle: String {
        selectedCity?.name ?? "Ubicación desconocida"
    }
    
    private func updatePosition() {
        position = .region(
            MKCoordinateRegion(center: currentCoordinate, span: defaultSpan)
        )
    }
}

