//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Roman Tolmachev on 21.01.2024.
//

import SwiftUI

struct InsetGalleryView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { galleryImage in
                    Image(galleryImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
           }
        }
        
    }
}

#Preview {
    InsetGalleryView(animal: Bundle.main.decode("animals.json")[4])
}
