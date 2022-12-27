//
//  LatestView.swift
//  Netflix
//
//  Created by Darma Wiryanata on 28/12/22.
//

import SwiftUI

struct LatestView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Spacer()
                    .padding(.leading, 1)
                
                ForEach(0 ..< 5) { item in
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
                
                Spacer()
                    .padding(.trailing, 1)
            }
        }
    }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
    }
}
