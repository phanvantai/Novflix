//
//  MoviePreviewCell.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import SwiftUI
import Kingfisher

struct MoviePreviewCell: View {
    
    var movie: Movie
    
    let colors : [Color] = [.yellow, .gray, .pink, .red, .blue, .green, .orange]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(colors.randomElement())
            )
            
            Image(movie.previewImageName)
                .resizable()
                .offset(y: -20)
                .scaledToFit()
                .frame(height: 65)
        }
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoviePreviewCell(movie: exampleMovie6)
                .frame(width: 165, height: 50)
        }
    }
}
