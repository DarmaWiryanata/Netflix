//
//  MovieGridCellView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct SmallMovieCellView: View {
    let movie: Movie
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
                .overlay {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.backdropPath)")!) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 100)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        Text("Loading ...")
                            .redacted(reason: .placeholder)
                    }
                }
            
            // Poster top gradient effect
            LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(movie.title)
                .font(.callout)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding([.bottom, .horizontal])
        }
        .frame(width: 150, height: 100)
    }
}

struct SmallGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        SmallMovieCellView(movie: Movie(
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
        ))
    }
}
