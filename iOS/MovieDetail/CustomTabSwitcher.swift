//
//  CustomTabSwitcher.swift
//  Novflix (iOS)
//
//  Created by Tai Phan Van on 30/07/2021.
//

import SwiftUI

enum CustomTab: String, CaseIterable {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case relevant = "MORE LIKE THIS"
}

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    
    var movie: Movie
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab), height: 30)
                        }
                    }
                }
            }
            
            switch currentTab {
            case .episodes:
                Text(currentTab.rawValue)
            case .trailers:
                Text(currentTab.rawValue)
            case .relevant:
                MoreLikeThis(movies: exampleMovies)
            }
        }
        .foregroundColor(.white)
    }
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CustomTabSwitcher(tabs: CustomTab.allCases, movie: exampleMovie1)
        }
    }
}
