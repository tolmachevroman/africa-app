//
//  CoverImageView.swift
//  Africa
//
//  Created by Roman Tolmachev on 7.01.2024.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        
        
    }
}

#Preview {
    CoverImageView()
}
