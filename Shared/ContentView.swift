//
//  ContentView.swift
//  Shared
//
//  Created by Tai Phan Van on 28/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag("HomeTab")
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag("SearchTab")
            
            ComingSoonView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Coming Soon")
                }
                .tag("ComingSoonTab")
            
            DownloadsView()
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                }
                .tag("DownloadsTab")
            
            Text("First")
                .tabItem {
                    Image(systemName: "equal")
                    Text("More")
                }
                .tag("MoreTab")
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
