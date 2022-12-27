//
//  LatestView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct LatestMoviesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Spacer()
                    .padding(.leading, 1)
                
                ForEach(0 ..< 5) { item in
                    LatestMovieCellView()
                }
                
                Spacer()
                    .padding(.trailing, 1)
            }
        }
    }
}

struct LatestMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        LatestMoviesView()
    }
}
