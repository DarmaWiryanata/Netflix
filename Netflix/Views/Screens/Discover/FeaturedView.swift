//
//  FeaturedView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct FeaturedView: View {
    @Binding var selectedMovie: Movie?
    @State private var index = 0
    
    let movies: [Movie]
    
    var body: some View {
        TabView(selection: $index) {
            ForEach(movies.prefix(3)) { movie in
                Button {
                    selectedMovie = movie
                } label: {
                    HStack {
                        Rectangle()
                            .overlay {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")!) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                } placeholder: {
                                    Text("Loading ...")
                                        .redacted(reason: .placeholder)
                                }
                            }
                            .padding(.trailing)
                        
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom)
                            
                            Text(movie.overview)
                                .font(.caption)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding()
                    .padding(.vertical)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.gray)
                    }
                .padding(.horizontal)
                }
            }
            .padding(.bottom, 48)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 250)
        .padding(.bottom, -40)
    }
}

//struct FeaturedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeaturedView(movies: [Movie(
//            id: 76600,
//            adult: false,
//            backdropPath: "/tQ91wWQJ2WRNDXwxuO7GCXX5VPC.jpg",
//            genreIDS: [
//                878,
//                28,
//                12
//            ],
//            originalLanguage: "en",
//            originalTitle: "Avatar: The Way of Water",
//            overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
//            popularity: 4109.455,
//            posterPath: "/94xxm5701CzOdJdUEdIuwqZaowx.jpg",
//            releaseDate: "2022-12-14",
//            title: "Avatar: The Way of Water",
//            video: false,
//            voteAverage: 8.1,
//            voteCount: 1001
//        )])
//    }
//}
