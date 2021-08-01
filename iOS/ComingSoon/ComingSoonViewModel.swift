//
//  ComingSoonViewModel.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import Foundation

class ComingSoonViewModel: ObservableObject {
    @Published var movies: [Movie]
    
    init() {
        self.movies = generateMovies(20)
    }
}
