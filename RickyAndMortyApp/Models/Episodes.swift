//
//  Episodes.swift
//  RickyAndMortyApp
//
//  Created by Michelli Cristina de Paulo Lima on 02/10/23.
//

import Foundation

enum EpisodesViewModelState {
    case initial
    case loading
    case loaded(episodes: Episodes)
    case error(errorMessage: String)
}

struct Episodes: Codable {
    let info: EpisodeInfo
    let results: [EpisodeResults]
}

struct EpisodeInfo: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
  }

struct EpisodeResults: Codable, Identifiable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
