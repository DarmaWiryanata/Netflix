//
//  DetailSheet.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct DetailSheet: View {
    @Environment(\.dismiss) private var dismiss
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
                }
            }
            .padding([.bottom, .horizontal])
            
            // Embedded YouTube video
            YouTubeVideoView(videoID: "5NjFuS_24v8")
                .frame(height: 200)
            
            // Video title
            HStack() {
                Text("Title")
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
            .padding([.top, .horizontal])
            .padding(.bottom, 4)
            
            // Video description
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in metus tellus.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Movie recommendation
            ContentHeaderView(title: "Latest")
            MoviesListView(largeCell: false)
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct DetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        DetailSheet()
    }
}
