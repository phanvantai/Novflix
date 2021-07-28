//
//  HomeView.swift
//  Novflix
//
//  Created by Tai Phan Van on 28/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack {
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
                                    }
                                }
                            }
                        }
                        
                    }
                }
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
