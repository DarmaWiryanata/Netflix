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
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        
                        TextField("Search", text: $searchQuery).modifier(TextFieldClearButton(text: $searchQuery))
                            .padding(.vertical, 4)
                            .padding(.trailing)
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        searchQuery = ""
                        showSearchField = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .padding(.vertical, 19)
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
