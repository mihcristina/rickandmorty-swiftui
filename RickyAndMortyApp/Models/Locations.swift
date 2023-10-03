//
//  Locations.swift
//  RickyAndMortyApp
//
//  Created by Michelli Cristina de Paulo Lima on 02/10/23.
//

import Foundation

enum LocationsViewModelState {
    case initial
    case loading
    case loaded(locations: Locations)
    case error(errorMessage: String)
}

struct Locations: Codable {
    let info: LocationInfo
    let results: [LocationResults]
}

struct LocationInfo: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

struct LocationResults: Codable, Identifiable {
     let id: Int
     let name: String
     let type: String
     let dimension: String
     let residents: [String]
     let url: String
     let created: String
}

