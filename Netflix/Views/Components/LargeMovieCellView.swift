//
//  LatestMovieCellView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct LargeMovieCellView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 200)
                .foregroundColor(.gray)
                .overlay {
                    Image(systemName: "photo")
                        .font(.largeTitle)
                }
            
            Text("Title")
                .padding(.horizontal)
                .padding(.top, 40)
        }
    }
}

struct LargeMovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        LargeMovieCellView()
    }
}
