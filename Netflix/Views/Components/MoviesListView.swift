//
//  LatestView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct MoviesListView: View {
    let largeCell: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                
                ForEach(0 ..< 5) { item in
                    if largeCell {
                        LargeMovieCellView()
                            .frame(width: 150)
                    } else {
                        SmallMovieCellView()
                    }
                }
                
                Spacer()
                    .padding(.trailing, 1)
            }
        }
    }
}

struct LatestMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(largeCell: true)
    }
}
