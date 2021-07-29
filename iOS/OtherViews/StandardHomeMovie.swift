//
//  StandardHomeMovie.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1 )
    }
}
