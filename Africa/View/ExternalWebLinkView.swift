//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Roman Tolmachev on 21.01.2024.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

#Preview {
    ExternalWebLinkView(animal: Bundle.main.decode("animals.json")[4])
}
