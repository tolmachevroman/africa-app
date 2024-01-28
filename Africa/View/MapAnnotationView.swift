//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Roman Tolmachev on 28.01.2024.
//

import SwiftUI

struct MapAnnotationView: View {
    
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill()
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 54, height: 54, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

#Preview {
    MapAnnotationView(location: Bundle.main.decode("locations.json")[0])
}
