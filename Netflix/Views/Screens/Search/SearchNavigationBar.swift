//
//  SearchNavigationBar.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct SearchNavigationBar: View {
    @Binding var showSearchField: Bool
    @Binding var searchQuery: String
    
    var body: some View {
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
    }
}

struct SearchNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            SearchNavigationBar(showSearchField: .constant(true), searchQuery: .constant(""))
        }
    }
}
