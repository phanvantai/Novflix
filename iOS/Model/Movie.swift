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
    var genre: HomeGenre = .AllGenres
    
    /// Personalization
    var currentEpisodeInfo: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    
    var creators: String
    var cast: String
    
    var moreLikeThisMovies: [Movie]
    
    var movieType: MovieType {
        return episodes == nil ? .movie : .tvShow
    }
    
    /// movie detail
    var episodes: [Episode]?
    var trailers: [Trailer]
    
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var promotionHeadline: String? {
        return self.name
    }
    
    var previewImageName: String
    var previewVideoURL: URL?
    
    var numberOfSeasonsDisplay: String {
        if let count = numberOfSeasons {
            return count == 1 ? "1 season" : "\(count) seasons"
        }
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisodeInfo {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
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
    
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

enum MovieType {
    case movie
    case tvShow
}
