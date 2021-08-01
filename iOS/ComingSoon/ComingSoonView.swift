//
//  ComingSoonView.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import SwiftUI

struct ComingSoonView: View {
    
    @State private var showNotificationList: Bool = false
    @State private var movieDetailToShow: Movie? = nil
    @State private var navBarHidden: Bool = true
    
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex: Int = 0
    
    @ObservedObject var viewModel = ComingSoonViewModel()
    
    func updateActiveIndex(from scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let real = scroll - 105
            let active = Int(real / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    var body: some View {
        
        let movies = viewModel.movies.enumerated().map({ $0 })
        
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newValue in
            scrollOffset = newValue
            updateActiveIndex(from: newValue)
        }
        
        return Group {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding) {
                    VStack {
                        NotificationBar(showNotificationList: $showNotificationList)
                        
                        ForEach(Array(movies), id: \.offset) { index, movie in
                            ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                                .frame(height: 400)
                                .overlay(
                                    Group {
                                        index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                    }
                                    .animation(.easeInOut)
                                )
                        }
                    }
                }
                .foregroundColor(.white)
                
                NavigationLink(
                    destination: Text("Notifications List"),
                    isActive: $showNotificationList,
                    label: {
                        EmptyView()
                    })
                    .navigationBarHidden(navBarHidden)
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                        self.navBarHidden = true
                    })
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                        self.navBarHidden = false
                    })
            }
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
