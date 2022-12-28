//
//  SearchView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchQuery: String
    @Binding var selectedMovie: Movie?
    @ObservedObject var movieVM: MovieViewModel
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        if searchQuery == "" {
            VStack {
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                    .padding()
                
                Text("Type something to search")
            }
            .frame(maxHeight: .infinity)
        } else {
            ScrollView {
                ContentHeaderView(title: "Search")
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(movieVM.searchedMovies) { movie in
                        Button {
                            selectedMovie = movie
                        } label: {
                            LargeMovieCellView(movie: movie)
                        }
                    }
                }
                .padding([.bottom, .horizontal])
            }
            .padding(.top, 53)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchQuery: .constant(""), selectedMovie: .constant(nil), movieVM: MovieViewModel())
    }
}
