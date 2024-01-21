//
//  InsetFactView.swift
//  Africa
//
//  Created by Roman Tolmachev on 21.01.2024.
//

import SwiftUI

struct InsetFactView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

#Preview {
    InsetFactView(animal: Bundle.main.decode("animals.json")[4])
}
