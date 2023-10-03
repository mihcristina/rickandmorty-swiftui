//
//  Characters.swift
//  RickyAndMortyApp
//
//  Created by Michelli Cristina de Paulo Lima on 23/09/23.
//

import Foundation

enum CharacterViewModelState {
    case initial
    case loading
    case loaded(characters: Characters)
    case error(errorMessage: String)
}

struct Characters: Codable {
    let info: Info
    let results: [Result]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

struct Result: Identifiable, Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin, location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

struct Location: Codable {
    var name: String
    var url: String
}

