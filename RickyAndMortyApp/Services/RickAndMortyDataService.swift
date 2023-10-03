//
//  RickAndMortyDataService.swift
//  RickyAndMortyApp
//
//  Created by Michelli Cristina de Paulo Lima on 02/10/23.
//

import Combine
import Foundation

class RickAndMortyDataService: RickAndMortyService {

    func getAllCharacters() -> AnyPublisher<Characters, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map({ $0.data })
            .decode(type: Characters.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getAllEpisodes() -> AnyPublisher<Episodes, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/episode")!)
            .map({ $0.data })
            .decode(type: Episodes.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getAllLocations() -> AnyPublisher<Locations, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/location")!)
            .map({ $0.data })
            .decode(type: Locations.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
