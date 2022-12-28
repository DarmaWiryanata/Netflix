//
//  FeaturedView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 27/12/22.
//

import SwiftUI

struct FeaturedView: View {
    var body: some View {
        HStack {
            Rectangle()
                .overlay {
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                Text("Title")
                    .font(.title3)
                    .bold()
                    .padding(.bottom)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in metus tellus.")
            }
        }
        .padding()
        .padding(.vertical)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
