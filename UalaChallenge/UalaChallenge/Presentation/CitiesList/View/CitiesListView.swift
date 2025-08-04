//
//  CitiesListView.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI

struct CitiesListView: View {
    @StateObject var viewModel = CitiesListViewModel()
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        if orientation.isLandscape {
            landscapeView
        } else {
            portraitView
        }
    }
    
    private var landscapeView: some View {
        HStack {
            portraitView
            MapView(selectedCity: $viewModel.selectedCity)
        }
    }
    
    private var portraitView: some View {
        VStack {
            VStack {
                searchBar
                favouriteFilterToggle
            }
            citiesList
        }
        .padding()
    }
    
    private var searchBar: some View {
        TextField("Buscar ciudad...", text: $viewModel.textInput)
            .onChange(of: viewModel.textInput) {
                viewModel.applyFilters()
            }
            .textFieldStyle(.roundedBorder)
    }
    
    private var citiesList: some View {
        VStack {
            List(viewModel.cities, id: \.id) { city in
                if orientation.isLandscape {
                    CityCell(city: city, viewModel: viewModel)
                        .onTapGesture {
                            viewModel.selectedCity = city
                        }
                } else {
                    NavigationLink(destination: MapView(selectedCity: .constant(city))) {
                        CityCell(city: city, viewModel: viewModel)
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(PlainListStyle())
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
    
    private var favouriteFilterToggle: some View {
        Toggle("Mostrar solo favoritos", isOn: $viewModel.favouriteFilterToggle)
            .onChange(of: viewModel.favouriteFilterToggle) {
                viewModel.toggleFavouritesTapped()
            }
    }
}

#Preview {
    CitiesListView()
}
