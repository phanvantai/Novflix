//
//  ComingSoonRow.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import SwiftUI
import Kingfisher
import AVKit

struct ComingSoonRow: View {
    
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    var player: AVPlayer {
        AVPlayer(url: exampleVideoURL)
    }
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(height: 200)
            
            VStack {
                
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3, height: 75)
                        .clipped()
                    
                    Spacer()
                    
                    SmallVerticallButton(text: "Remind Me", isOnImage: "bell", isOffImage: "bell", isOn: true) {
                        //
                    }
                    .padding(.horizontal)
                    
                    SmallVerticallButton(text: "Info", isOnImage: "info.circle", isOffImage: "bell", isOn: true) {
                        movieDetailToShow = movie
                    }
                    .padding(.trailing, 24)
                }
                .font(.headline)
                
                VStack(alignment: .leading) {
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    Text(movie.episodeDescriptionDisplay)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ComingSoonRow(movie: exampleMovie6, movieDetailToShow: .constant(nil))
        }
    }
}
