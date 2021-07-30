//
//  HomeView.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack {
                    
                    /// Top Menu
                    TopRowButton(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    /// Movie Preview
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    /// List with category
                    HomeStack(viewModel: viewModel, topRowSelection: topRowSelection, homeGenre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { row in
                            Button(action: {
                                topRowSelection = row
                                showTopRowSelection = false
                            }, label: {
                                if topRowSelection == row {
                                    Text(row.rawValue)
                                        .foregroundColor(.white)
                                        .bold()
                                } else {
                                    Text(row.rawValue)
                                        .foregroundColor(.gray)
                                }
                                
                            })
                        }
                        Spacer()
                        
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        ScrollView {
                            ForEach(viewModel.allGenre, id: \.self) { genre in
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    if homeGenre == genre {
                                        Text(genre.rawValue)
                                            .foregroundColor(.white)
                                            .bold()
                                    } else {
                                        Text(genre.rawValue)
                                            .foregroundColor(.gray)
                                    }
                                    
                                })
                                .padding(.bottom, 40)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
