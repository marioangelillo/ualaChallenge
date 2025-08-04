//
//  CityUseCaseContainer.swift
//  UalaChallenge
//
//  Created by Mario Angelillo on 03/08/2025.
//

protocol CityUseCaseContainerProtocol {
    var getCityUseCase: GetCitiesUseCaseProtocol { get }
    var getFavoriteCitiesUseCase: GetFavouriteCitiesUseCaseProtocol { get }
    var setFavoriteCityUseCase: SetFavouriteCitiesUseCaseProtocol { get }
}

struct CityUseCaseContainer: CityUseCaseContainerProtocol {
    let getCityUseCase: GetCitiesUseCaseProtocol
    let getFavoriteCitiesUseCase: GetFavouriteCitiesUseCaseProtocol
    let setFavoriteCityUseCase: SetFavouriteCitiesUseCaseProtocol
    
    init(
        getCityUseCase: GetCitiesUseCaseProtocol,
        getFavoriteCitiesUseCase: GetFavouriteCitiesUseCaseProtocol,
        setFavoriteCityUseCase: SetFavouriteCitiesUseCaseProtocol
    ) {
        self.getCityUseCase = getCityUseCase
        self.getFavoriteCitiesUseCase = getFavoriteCitiesUseCase
        self.setFavoriteCityUseCase = setFavoriteCityUseCase
    }
}
