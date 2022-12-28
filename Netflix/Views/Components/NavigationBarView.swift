//
//  NavigationBarView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct NavigationBarView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
            
            content
        }
        .padding(.horizontal)
        .background {
            Rectangle()
                .foregroundColor(.gray.opacity(0.2))
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView {
            Text("Netflix")
        }
    }
}
