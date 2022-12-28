//
//  SearchNavigationBar.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import Combine
import SwiftUI

struct SearchNavigationBar: View {
    @Binding var showSearchField: Bool
    @FocusState private var isFocused: Bool
    @ObservedObject var movieVM: MovieViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading)
            
            TextField("Search", text: $movieVM.searchQuery)
                .focused($isFocused)
                .modifier(TextFieldClearButton(text: $movieVM.searchQuery))
                .padding(.vertical, 4)
                .padding(.trailing)
                .onReceive(
                    movieVM.$searchQuery
                        .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
                ) {
                    guard !$0.isEmpty else { return }
                    print(">> searching for: \($0)")
                    movieVM.searchMovies()
                }
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
        }
        .onAppear {
            isFocused = true
        }
        
        Button {
            movieVM.searchQuery = ""
            showSearchField = false
            movieVM.searchedMovies = []
        } label: {
            Image(systemName: "xmark")
        }
        .padding(.vertical, 19)
    }
}

struct SearchNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            SearchNavigationBar(showSearchField: .constant(true), movieVM: MovieViewModel())
        }
    }
}
