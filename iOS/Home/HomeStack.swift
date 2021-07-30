//
//  HomeStack.swift
//  Novflix
//
//  Created by Tai Phan Van on 30/07/2021.
//

import SwiftUI

struct HomeStack: View {
    
    var viewModel: HomeViewModel
    
    var topRowSelection: HomeTopRow
    var homeGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
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
                        ForEach(viewModel.getMovies(forCategory: category, andHomeRow: topRowSelection, andGenre: homeGenre)) { movie in
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

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                HomeStack(viewModel: HomeViewModel(), topRowSelection: .home, homeGenre: .AllGenres, movieDetailToShow: .constant(nil))
            }
            .foregroundColor(.white)
            
        }
        
    }
}
