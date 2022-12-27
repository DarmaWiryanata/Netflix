//
//  ContentView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                }
                .padding(.top, 60)
                
                NavigationBarView {
                    Text("NETFLIX")
                    
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                }
            }
            
            .toolbar(.hidden)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

struct NavigationBarView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
            
            content
        }
        .padding()
        .background {
            Rectangle()
                .foregroundColor(.clear)
        }
    }
}
