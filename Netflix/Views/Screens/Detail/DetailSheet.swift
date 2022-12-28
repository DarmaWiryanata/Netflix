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
        VStack(alignment: .leading) {
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
            .padding(.bottom)
            
            // Embedded YouTube video
            Rectangle()
                .frame(height: 200)
                .overlay {
                    Image(systemName: "play.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            
            // Video title & description
            HStack() {
                Text("Title")
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
            .padding(.top)
            .padding(.bottom, 4)
            
            // Video description
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in metus tellus.")
            
            // Movie recommendation
            ContentHeaderView(title: "Latest")
            MoviesListView(largeCell: false)
            
            Spacer()
        }
        .padding()
    }
}

struct DetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        DetailSheet()
    }
}
