//
//  MainScreen.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct MainScreen: View {
    
    @State var showSearchField = false
    @State var selectedMovie: Movie?
    @StateObject var movieVM = MovieViewModel()
    @StateObject var videoVM = VideoViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            if showSearchField {
                SearchView(searchQuery: $movieVM.searchQuery, selectedMovie: $selectedMovie, movieVM: movieVM)
                    .padding(.top, movieVM.searchQuery == "" ? 53 : 0)
                
                NavigationBarView {
                    SearchNavigationBar(showSearchField: $showSearchField, movieVM: movieVM)
                }
            } else {
                DiscoverView(selectedMovie: $selectedMovie, movieVM: movieVM)
                    .padding(.top, 53)
                
                NavigationBarView {
                    DiscoverNavigationBar(showSearchField: $showSearchField)
                }
            }
        }
        .animation(.interactiveSpring(), value: showSearchField)
        .sheet(item: $selectedMovie) { movie in
            DetailSheet(bindedSelectedMovie: $selectedMovie, movieVM: movieVM, videoVM: videoVM, selectedMovie: movie)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
