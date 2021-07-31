//
//  SearchViewModel.swift
//  Novflix
//
//  Created by Tai Phan Van on 31/07/2021.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published var searchText: String = ""
    
    @Published var viewState: ViewState = .ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    
    @Published var isShowingPopularMovies: Bool = true
    
    init() {
        getPopularMovies()
    }
    
    public func searchTextDidUpdate() {
        print("TaiPV \(searchText)")
        updateViewState(to: .loading)
        
        if !searchText.isEmpty {
            isShowingPopularMovies = false
            getSearchResults()
        } else {
            isShowingPopularMovies = true
        }
    }
    
    private func getPopularMovies() {
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResults() {
        
        let haveResult = Int.random(in: 0...5)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                self.searchResults = []
                self.updateViewState(to: .empty)
            } else {
                self.searchResults = generateMovies(20)
                self.updateViewState(to: .ready)
            }
        }
    }
    
    private func updateViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            
            self.isLoading = state == .loading
        }
    }
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
