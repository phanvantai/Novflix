//
//  MovieDetail.swift
//  Novflix
//
//  Created by Tai Phan Van on 29/07/2021.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        print(movie.name)
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack {
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // close screen
                            movieDetailToShow = nil
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 28))
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, 22)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            StandardHomeMovie(movie: movie)
                                .frame(width: screen.width / 2.5, height: screen.width / 2)
                                .clipped()
                            
                            MovieInfoSubheadline(movie: movie)
                            
                            if movie.promotionHeadline != nil {
                                Text(movie.promotionHeadline!)
                                    .bold()
                                    .font(.headline)
                            }
                            
                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                                // play
                            }
                            
                            /// Current Episode Info
                            CurrentEpisodeInfomation(movie: movie)
                            
                            ConbuttriesInfo(movie: movie)
                            
                            HStack(spacing: 60) {
                                SmallVerticallButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                    //
                                }
                                
                                SmallVerticallButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: false) {
                                    //
                                }
                                
                                SmallVerticallButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                    //
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            CustomTabSwitcher(tabs: CustomTab.allCases, movie: movie, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                            
                        }
                        .padding(.horizontal, 10)
                        
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                if showSeasonPicker {
                    Group {
                        Color.black.opacity(0.9)
                        
                        VStack(spacing: 40) {
                            Spacer()
                            
                            ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                                Button(action: {
                                    self.selectedSeason = season + 1
                                    self.showSeasonPicker = false
                                }, label: {
                                    Text("Season \(season + 1)")
                                        .font(selectedSeason == season + 1 ? .title : .title2)
                                        .bold()
                                        .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                })
                            }
                            Spacer()
                            
                            Button(action: {
                                showSeasonPicker = false
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                            })
                            .padding(.bottom, 30)
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie2, movieDetailToShow: .constant(nil))
    }
}

struct MovieInfoSubheadline: View {
    
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct ConbuttriesInfo: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInfomation: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.episodeInfoDisplay)
                .bold()
                .padding(.vertical, 4)
            Text(movie.episodeDescriptionDisplay)
                .font(.subheadline)
        }
    }
}
