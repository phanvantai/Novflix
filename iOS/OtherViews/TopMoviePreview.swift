//
//  TopMoviePreview.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    var movie: Movie
    
    func isLastCategory(_ cat: String) -> Bool {
        let count = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != count {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if !isLastCategory(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Spacer()
                    
                    SmallVerticallButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        print("my list on click")
                    }
                    Spacer()
                    
                    PlayButton(text: "Play", imageName: "play.fill") {
                        print("play on click")
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticallButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        print("info on click")
                    }
                    Spacer()
                    Spacer()
                }
                .padding(.vertical, 4)
            }
            .background(
                LinearGradient.blackOpacityGradient
                    .padding(.top, 300)
            )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
