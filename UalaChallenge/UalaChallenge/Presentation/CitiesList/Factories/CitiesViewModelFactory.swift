//
//  CitiesViewModelFactory.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

protocol CitiesViewModelFactoryProtocol {
    static func make() -> CitiesListViewModel
}

struct CitiesViewModelFactory: CitiesViewModelFactoryProtocol {
    static func make() -> CitiesListViewModel {
        let localDataSource = CityLocalDataSource()
        let remoteDataSource = CityRemoteDataSource()
        let repo = CityRepository(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
        
        let getCitiesUseCase = GetCitiesUseCase(repository: repo)
        let getFavoriteUseCase = GetFavouriteCitiesUseCase(repository: repo)
        let setFavoriteUseCase = SetFavouriteCitiesUseCase(repository: repo)
        
        let useCasesContainer = CityUseCaseContainer(getCityUseCase: getCitiesUseCase,
                                                     getFavoriteCitiesUseCase: getFavoriteUseCase,
                                                     setFavoriteCityUseCase: setFavoriteUseCase)
        
        return CitiesListViewModel(cityUseCases: useCasesContainer)
    }
}
