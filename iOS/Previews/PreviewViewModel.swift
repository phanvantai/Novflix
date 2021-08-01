//
//  PreviewViewModel.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import Foundation

class PreviewViewModel: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
