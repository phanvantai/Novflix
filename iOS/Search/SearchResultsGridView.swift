//
//  SearchResultsGridView.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import SwiftUI

struct SearchResultsGridView: View {
    
    var movies: [Movie]

    @Binding var movieDetailToShow: Movie?

    let columns: [GridItem] = [ GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]

    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 160)
                    .clipped()
                    .onTapGesture(perform: {
                        movieDetailToShow = movie
                    })
            }
        }
    }
}

struct SearchResultsGridView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchResultsGridView(movies: exampleMovies, movieDetailToShow: .constant(nil))

        }
    }
}
