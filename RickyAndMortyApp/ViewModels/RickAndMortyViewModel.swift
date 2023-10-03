//
//  RickAndMortyViewModel.swift
//  RickyAndMortyApp
//
//  Created by Michelli Cristina de Paulo Lima on 23/09/23.
//

import Combine
import SwiftUI

class RickAndMortyViewModel: ObservableObject {

    @Published var charactersState: CharacterViewModelState = CharacterViewModelState.initial
    @Published var episodeState: EpisodesViewModelState = EpisodesViewModelState.initial
    @Published var locationState: LocationsViewModelState = LocationsViewModelState.initial

    let rickAndMortyDataService: RickAndMortyDataService = RickAndMortyDataService()
    var cancellable = Set<AnyCancellable>()

    init() {
        getAllCharacters()
        getAllEpisodes()
        getAllLocations()
    }

    func getAllCharacters() {
        rickAndMortyDataService.getAllCharacters()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.charactersState = CharacterViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Characters in
                self?.charactersState = CharacterViewModelState.loaded(characters: Characters)
            }
            .store(in: &cancellable)

    }
    func getAllEpisodes() {
        rickAndMortyDataService.getAllEpisodes()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.episodeState = EpisodesViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Episodes in
                self?.episodeState = EpisodesViewModelState.loaded(episodes: Episodes)
            }
            .store(in: &cancellable)

    }

    func getAllLocations() {
        rickAndMortyDataService.getAllLocations()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.episodeState = EpisodesViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Locations in
                self?.locationState = LocationsViewModelState.loaded(locations: Locations)
            }
            .store(in: &cancellable)
    }
}
