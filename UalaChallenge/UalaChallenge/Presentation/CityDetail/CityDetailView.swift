//
//  CityDetailView.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI

struct CityDetailView: View {
    let city: City
    @Binding var showView: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            MapView(selectedCity: .constant(city))
                .frame(height: 250)
            
            Text(city.cityDetailTitle)
                .font(.title)
                .bold()
            
            Text(city.cityDetailSubtitle)
                .font(.headline)
            
            Button("Volver") {
                showView = false
            }
            
            Spacer()
        }
    }
}
