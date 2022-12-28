//
//  MainScreen.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct MainScreen: View {
    @State var showSearchField = false
    @State var searchQuery = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            DiscoverView()
                .padding(.top, 53)
            
            // Navigation bar
            NavigationBarView {
                if showSearchField {
                    SearchNavigationBar(showSearchField: $showSearchField, searchQuery: $searchQuery)
                } else {
                    DiscoverNavigationBar(showSearchField: $showSearchField)
                }
            }
            .animation(.linear, value: showSearchField)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
