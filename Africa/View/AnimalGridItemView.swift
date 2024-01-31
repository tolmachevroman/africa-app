//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Roman Tolmachev on 30.01.2024.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    AnimalGridItemView(animal: Bundle.main.decode("animals.json")[0])
}
