//
//  ContentView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    // MARK: Featured movies
                    FeaturedView()
                    
                    // MARK: Latest movies
                    ContentHeaderView(title: "Latest")
                    LatestMoviesView()
                }
                .padding(.top, 60)
                
                // Navigation bar
                NavigationBarView {
                    Text("NETFLIX")
                    
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                }
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
