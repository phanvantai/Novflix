//
//  PreviewView.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var viewModel: PreviewViewModel
    
    func isLastCategory(_ cat: String) -> Bool {
        let count = viewModel.movie.categories.count
        
        if let index = viewModel.movie.categories.firstIndex(of: cat) {
            if index + 1 != count {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerPlayerView(videoURL: viewModel.movie.trailers.first?.videoURL, playingVideo: .constant(true))
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text(viewModel.movie.name)
                            .foregroundColor(viewModel.movie.accentColor)
                            .font(.largeTitle)
                            .bold()
                    })
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                
                Spacer()
                
                HStack {
                    ForEach(viewModel.movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if !isLastCategory(category) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                            
                        }
                    }
                }
                
                HStack {
                    
                    Spacer()
                    
                    SmallVerticallButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", color: viewModel.movie.accentColor, isOn: true) {
                        //
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(viewModel.movie.accentColor, width: 3)
                    })
                    
                    Spacer()
                    
                    SmallVerticallButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", color: viewModel.movie.accentColor, isOn: true) {
                        //
                    }
                    
                    Spacer()
                }
                .padding(.top, 14)
            }
            .padding(.bottom, 48)
            .foregroundColor(viewModel.movie.accentColor)
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(viewModel: PreviewViewModel(movie: exampleMovie6))
    }
}
