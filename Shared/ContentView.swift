//
//  ContentView.swift
//  Shared
//
//  Created by Tai Phan Van on 28/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldPreviewFullScreen: Bool = false
    @State private var previewStartingIndex: Int = 0
    
    @State private var currentPreviewPostion: CGFloat = 1000
    @State private var newPreviewPostion: CGFloat = 1000
    
    @State private var horizontalPreviewDragActive: Bool = false
    
    let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                if horizontalPreviewDragActive {
                    return
                }
                
                if currentPreviewPostion == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        horizontalPreviewDragActive = true
                        return
                    }
                }
                
                // Drag vertical only
                let shouldBePosition = value.translation.height + self.newPreviewPostion
                if shouldBePosition < 0 {
                    return
                } else {
                    self.currentPreviewPostion = shouldBePosition
                }
            }
            .onEnded { value in
                //
                if horizontalPreviewDragActive {
                    horizontalPreviewDragActive = false
                    return
                }
                let shouldBePosition = value.translation.height + self.newPreviewPostion
                if shouldBePosition < 0 {
                    self.currentPreviewPostion = .zero
                    self.newPreviewPostion = .zero
                } else {
                    let closingPoint = screen.size.height * 0.2
                    if shouldBePosition > closingPoint {
                        withAnimation {
                            self.shouldPreviewFullScreen = false
                            self.currentPreviewPostion = screen.height + 20
                            self.newPreviewPostion = screen.height + 20
                        }
                    } else {
                        withAnimation {
                            self.currentPreviewPostion = .zero
                            self.newPreviewPostion = .zero
                        }
                    }
                }
                horizontalPreviewDragActive = false
            }
        
        return ZStack {
            TabView {
                HomeView(shouldPreviewFullScreen: $shouldPreviewFullScreen, previewStartingIndex: $previewStartingIndex)
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
            
            PreviewList(movies: exampleMovies, currentSelection: $previewStartingIndex, isVisible: $shouldPreviewFullScreen, externalDragGesture: previewDragGesture)
                .offset(y: currentPreviewPostion)
                .isHidden(!shouldPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: shouldPreviewFullScreen, perform: { value in
            if value {
                withAnimation {
                    currentPreviewPostion = .zero
                    newPreviewPostion = .zero
                }
            } else {
                withAnimation {
                    currentPreviewPostion = screen.height + 20
                    newPreviewPostion = screen.height + 20
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
