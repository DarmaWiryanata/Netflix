//
//  DiscoverNavigationBar.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct DiscoverNavigationBar: View {
    @Binding var showSearchField: Bool
    
    var body: some View {
        Text("NETFLIX")
        
        Spacer()
        
        Button {
            showSearchField = true
        } label: {
            Image(systemName: "magnifyingglass")
        }
        .padding(.vertical, 17)
    }
}

struct DiscoverNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            DiscoverNavigationBar(showSearchField: .constant(false))
        }
    }
}
