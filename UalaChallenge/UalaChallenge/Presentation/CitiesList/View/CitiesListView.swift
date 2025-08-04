//
//  CitiesListView.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

import SwiftUI

struct CitiesListView: View {
    @StateObject var viewModel: CitiesListViewModel
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
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    searchBar
                    favouriteFilterToggle
                }
                citiesList
            }
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
            if orientation.isLandscape {
                landscapeCitiesList
            } else {
                portraitCitiesList
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
    
    private var landscapeCitiesList: some View {
        List(viewModel.cities, id: \.id) { city in
            CityCell(city: city, viewModel: viewModel)
                .onTapGesture {
                    viewModel.selectedCity = city
                }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portraitCitiesList: some View {
        List(viewModel.cities, id: \.id) { city in
            NavigationLink(destination: MapView(selectedCity: .constant(city))) {
                CityCell(city: city, viewModel: viewModel)
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(PlainListStyle())
    }
    
    private var favouriteFilterToggle: some View {
        Toggle("Mostrar solo favoritos", isOn: $viewModel.favouriteFilterToggle)
            .onChange(of: viewModel.favouriteFilterToggle) {
                viewModel.toggleFavouritesTapped()
            }
    }
}

#Preview {
    CitiesListView(viewModel: CitiesViewModelFactory.make())
}
