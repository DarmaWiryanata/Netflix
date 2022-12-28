//
//  MainScreen.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct MainScreen: View {
    
    @State var showSearchField = false
    @State var searchQuery = ""
    @State var selectedMovie: Movie?
    @StateObject var movieVM = MovieViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            if showSearchField {
                SearchView(searchQuery: $searchQuery)
                    .padding(.top, searchQuery == "" ? 53 : 0)
                
                NavigationBarView {
                    SearchNavigationBar(showSearchField: $showSearchField, searchQuery: $searchQuery)
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
            DetailSheet()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
