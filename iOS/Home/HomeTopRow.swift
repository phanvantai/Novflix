//
//  HomeTopRow.swift
//  Novflix
//
//  Created by Tai Phan Van on 30/07/2021.
//

import Foundation

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String, CaseIterable {
    case AllGenres = "All Genres"
    case Action
    case Comedy
    case Horror
    case Thriller
}
