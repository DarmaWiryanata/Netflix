//
//  DiscoverView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ScrollView {
            // MARK: Featured movies
            FeaturedView()
                .padding(.top)
            
            // MARK: Latest movies
            ContentHeaderView(title: "Latest")
            MoviesListView(largeCell: false)
            
            // MARK: Action movies
            ContentHeaderView(title: "Action")
            MoviesListView(largeCell: true)
                .padding(.bottom)
            
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
