//
//  MapView.swift
//  Africa
//
//  Created by Roman Tolmachev on 6.01.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var position: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        var mapCameraPosition = MapCameraPosition.region(mapRegion)
        
        return mapCameraPosition
    } ()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    
    var body: some View {
        Map(position: $position) {
            ForEach(locations) { item in

                Annotation(item.name, coordinate: item.location, anchor: .bottom) {
                    MapAnnotationView(location: item)
                }
                
            }
        }
        .onMapCameraChange(frequency: .continuous) { mapCameraUpdateContext in
            latitude = mapCameraUpdateContext.camera.centerCoordinate.latitude
            longitude = mapCameraUpdateContext.camera.centerCoordinate.longitude
        }
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black.cornerRadius(8).opacity(0.6)
                )
                .padding(),
            alignment: .top
        )
    }
}

#Preview {
    MapView()
}
