//
//  PreviewList.swift
//  Novflix
//
//  Created by Tai Phan Van on 02/08/2021.
//

import SwiftUI

struct PreviewList: View {
    var movies: [Movie]
    
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    
    @State private var currentTranslation: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PagerView(pageCount: movies.count, currentIndex: $currentSelection, translation: $currentTranslation) {
                ForEach(0..<movies.count) { movieIndex in
                    let movie = movies[movieIndex]
                    PreviewView(viewModel: PreviewViewModel(movie: movie))
                }
            }
        }
    }
}

struct PreviewList_Previews: PreviewProvider {
    static var previews: some View {
        PreviewList(movies: exampleMovies, currentSelection: .constant(0), isVisible: .constant(true))
    }
}
