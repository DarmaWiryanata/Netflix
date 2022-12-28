//
//  DetailSheet.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct DetailSheet: View {
    @Binding var bindedSelectedMovie: Movie?
    @ObservedObject var movieVM: MovieViewModel
    @ObservedObject var videoVM: VideoViewModel
    @Environment(\.dismiss) private var dismiss
    
    let selectedMovie: Movie
    @State var abc = false
    
    var body: some View {
        VStack {
            // Close button
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.primary)
                }
            }
            .padding([.bottom, .horizontal])
            
            // Embedded YouTube video
            YouTubeVideoView(videoID: videoVM.movieVideos.first?.key ?? "abc")
                .frame(height: 200)
            
            // Video title
            HStack() {
                Text(selectedMovie.title)
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
            .padding([.top, .horizontal])
            .padding(.bottom, 4)
            
            // Video description
            Text(selectedMovie.overview)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Movie recommendation
            ContentHeaderView(title: "Latest")
            if let latestMovies = movieVM.movies["latest"] {
                MoviesListView(isLoadingPage: $movieVM.isLoadingLatest, selectedMovie: $bindedSelectedMovie, largeCell: false, movies: latestMovies)
            }
            
            Spacer()
        }
        .padding(.vertical)
        .onAppear {
            videoVM.getVideos(id: selectedMovie.id)
        }
    }
}

//struct DetailSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailSheet(movieVM: MovieViewModel())
//    }
//}
