//
//  Movie.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import Foundation

struct Movie: Identifiable {
    
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    /// Personalization
    var currentEpisodeInfo: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    
    var creators: String
    var cast: String
    
    /// movie detail
    var episodes: [Episode]?
    
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var promotionHeadline: String?
    
    var numberOfSeasonsDisplay: String {
        if let count = numberOfSeasons {
            return count == 1 ? "1 season" : "\(count) seasons"
        }
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisodeInfo {
            return "S\(current.season):E\(current.episode) \(current.espisodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.espisodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisodeInfo {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    
    var espisodeName: String
    var description: String
    var season: Int
    var episode: Int
}
