//
//  LatestView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct MoviesListView: View {
    
    @Binding var isLoadingPage: Bool
    @Binding var selectedMovie: Movie?
    
    let largeCell: Bool
    var movies: [Movie]
    
    var body: some View {
        if isLoadingPage {
            ProgressView()
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    Spacer()
                        .padding(.leading, 1)
                    
                    ForEach(movies) { movie in
                        if largeCell {
                            Button {
                                selectedMovie = movie
                            } label: {
                                LargeMovieCellView(movie: movie)
                                    .frame(width: 150)
                            }
                        } else {
                            Button {
                                selectedMovie = movie
                            } label: {
                                SmallMovieCellView(movie: movie)
                            }
                        }
                    }
                    
                    Spacer()
                        .padding(.trailing, 1)
                }
            }
        }
    }
}

struct LatestMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(isLoadingPage: .constant(false), selectedMovie: .constant(nil), largeCell: true, movies: [Movie(
            id: 76600,
            adult: false,
            backdropPath: "/tQ91wWQJ2WRNDXwxuO7GCXX5VPC.jpg",
            genreIDS: [
                878,
                28,
                12
            ],
            originalLanguage: "en",
            originalTitle: "Avatar: The Way of Water",
            overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
            popularity: 4109.455,
            posterPath: "/94xxm5701CzOdJdUEdIuwqZaowx.jpg",
            releaseDate: "2022-12-14",
            title: "Avatar: The Way of Water",
            video: false,
            voteAverage: 8.1,
            voteCount: 1001
        )])
    }
}
