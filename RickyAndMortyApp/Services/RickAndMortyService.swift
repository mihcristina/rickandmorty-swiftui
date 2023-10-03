//
//  RickAndMortyService.swift
//  RickyAndMortyApp
//
//  Created by Michelli Cristina de Paulo Lima on 02/10/23.
//

import Combine
import Foundation

protocol RickAndMortyService {
    func getAllCharacters() -> AnyPublisher<Characters, Error>
    func getAllEpisodes() -> AnyPublisher<Episodes, Error>
    func getAllLocations() -> AnyPublisher<Locations, Error>
}
