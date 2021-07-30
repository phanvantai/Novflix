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
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack {
                    
                    /// Top Menu
                    TopRowButtons()
                    
                    /// Movie Preview
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    /// List with category
                    ForEach(viewModel.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(viewModel.getMovies(forCategory: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200, alignment: .center)
                                            .padding(.horizontal, 20)
                                            .onTapGesture {
                                                movieDetailToShow = movie
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
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

struct TopRowButtons: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            .buttonStyle(PlainButtonStyle())
            Spacer()
            Button(action: {
                
            }, label: {
                Text("TV shows")
            })
            .buttonStyle(PlainButtonStyle())
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Movies")
            })
            .buttonStyle(PlainButtonStyle())
            Spacer()
            Button(action: {
                
            }, label: {
                Text("My List")
            })
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}
