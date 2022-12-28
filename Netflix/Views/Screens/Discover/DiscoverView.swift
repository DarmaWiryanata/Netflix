//
//  DiscoverView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject var movieVM: MovieViewModel
    
    var body: some View {
        ScrollView {
            // MARK: Featured movies
            FeaturedView()
                .padding(.top)
            
            // MARK: Latest movies
            ContentHeaderView(title: "Latest")
            if let latestMovies = movieVM.movies["latest"] {
                MoviesListView(isLoadingPage: $movieVM.isLoadingLatest, largeCell: false, movies: latestMovies)
            }
            
            // MARK: Action movies
            ContentHeaderView(title: "Action")
            if let actionMovies = movieVM.movies["action"] {
                MoviesListView(isLoadingPage: $movieVM.isLoadingAction, largeCell: true, movies: actionMovies)
                    .padding(.bottom)
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(movieVM: MovieViewModel())
    }
}
