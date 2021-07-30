//
//  HomeViewModel.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var movies: [String : [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map { String($0) }
    }
    
    public var allGenre: [HomeGenre] = HomeGenre.allCases
    
    public func getMovies(forCategory cat: String, andHomeRow homRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ $0.movieType == .movie && $0.genre == genre })
        case .tvShows:
            return (movies[cat] ?? []).filter({ $0.movieType == .tvShow && $0.genre == genre })
        case .myList:
            return movies[cat] ?? []
        }
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["New Release"] = exampleMovies.shuffled()
        movies["Actions"] = exampleMovies.shuffled()
        movies["Future"] = exampleMovies.shuffled()
    }
}
