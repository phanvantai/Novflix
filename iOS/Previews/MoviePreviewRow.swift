//
//  MoviePreviewRow.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import SwiftUI

struct MoviePreviewRow: View {
    
    var movies: [Movie]
    
    @Binding var shouldPreviewFullScreen: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Previews")
                .bold()
                .font(.title3)
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 4)
                            .padding(.leading, 6)
                            .onTapGesture(perform: {
                                previewStartingIndex = movieIndex
                                shouldPreviewFullScreen = true
                            })
                    }
                }
            }
            Spacer()
        }
        .foregroundColor(.white)
        .frame(height: 185)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoviePreviewRow(movies: exampleMovies, shouldPreviewFullScreen: .constant(false), previewStartingIndex: .constant(0))
        }
    }
}
