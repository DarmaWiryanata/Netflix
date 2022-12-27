//
//  MovieGridCellView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct SmallMovieCellView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 150, height: 100)
                .foregroundColor(.gray)
                .overlay {
                    Image(systemName: "house")
                }
            
            Text("Title")
                .padding([.bottom, .horizontal])
        }
    }
}

struct SmallGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        SmallMovieCellView()
    }
}
