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
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .padding(.leading)
                            
                            TextField("Search", text: $searchQuery).modifier(TextFieldClearButton(text: $searchQuery))
                                .padding(.vertical, 4)
                                .padding(.trailing)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                        }
                        
                        Button {
                            searchQuery = ""
                            showSearchField = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .padding(.vertical, 19)
                    } else {
                        Text("NETFLIX")
                        
                        Spacer()
                        
                        Button {
                            showSearchField = true
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                        .padding(.vertical, 17)
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
