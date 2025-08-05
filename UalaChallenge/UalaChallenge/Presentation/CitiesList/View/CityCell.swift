//
//  CityCell.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI

struct CityCell: View {
    let city: City
    let viewModel: CitiesListViewModel
    let isFavorite: Bool
    @State var showDetailsSheet = false
    
    var body: some View {
        HStack {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(Color.red)
                .padding(.trailing, 10)
                .onTapGesture {
                    viewModel.favouriteIconTapped(city.id, isFavorite)
                }
            
            VStack(alignment: .leading) {
                Text(city.cityDetailTitle)
                    .bold()
                Text(city.cityDetailSubtitle)
                    .italic()
            }
            
            Spacer()
            
            Image(systemName: "info")
                .accessibilityIdentifier("InfoButton_\(city.id)")
                .foregroundStyle(Color.blue)
                .padding(.horizontal, 10)
                .bold()
                .onTapGesture {
                    showDetailsSheet = true
                }
        }
        .padding()
        .sheet(isPresented: $showDetailsSheet) {
            CityDetailView(city: city, showView: $showDetailsSheet)
        }
    }
}

#Preview {
    CityCell(city: .init(id: 1, name: "Tucumán", country: "Argentina", coordinate: .init(lat: 12.0, lon: 124.1)), viewModel: CitiesViewModelFactory.make(), isFavorite: true)
}
