//
//  ContentView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct MainScreen: View {
    @State var showSearchField = false
    @State var searchQuery = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    // MARK: Featured movies
                    FeaturedView()
                        .padding(.top)
                    
                    // MARK: Latest movies
                    ContentHeaderView(title: "Latest")
                    MoviesListView(largeCell: false)
                    
                    // MARK: Action movies
                    ContentHeaderView(title: "Action")
                    MoviesListView(largeCell: true)
                        .padding(.bottom)
                    
                }
                .padding(.top, 53)
                
                // Navigation bar
                NavigationBarView {
                    if showSearchField {
                        TextField("Search", text: $searchQuery)
                        
                        Button {
                            searchQuery = ""
                            showSearchField = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    } else {
                        Text("NETFLIX")
                        
                        Spacer()
                        
                        Button {
                            showSearchField = true
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
                .animation(.linear, value: showSearchField)
            }
            
            .toolbar(.hidden)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
