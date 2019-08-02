//
//  MapBoxView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI
import MapKit

struct MapBoxView: View {
    
    @State var locationManager = CLLocationManager()
    @Binding var location: CLLocationCoordinate2D
    @Binding var annotations: [Artwork]
    @Binding var state: SnappState
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomTrailing) {
                MapView(locationManager: self.$locationManager, userLocation: self.$location, annotations: self.$annotations, state: self.$state)
                if self.state == .source {
                    Button(action: {
                        self.getUserLocation()
                    }){
                        Image(systemName: "location.fill")
                            .frame(width: 60, height: 60)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .shadow(radius: 2, x:0, y: 3)
                            .offset(x: -30, y: -30)
                    }
                    .animation(.easeIn(duration: 0.5))
                }
            }
            if self.state == .source {
                Button(action: {
                    self.state = .destination
                    self.annotations.append(Artwork(coordinate: self.location, tag: .source))
                }){
                    Image("sourceMarker")
                        .renderingMode(.original)
                }
                .offset(y: -30)
            } else if self.state == .destination {
                Button(action: {
                    self.state = .price
                    self.annotations.append(Artwork(coordinate: self.location, tag: .destination))
                }){
                    Image("destinationMarker")
                        .renderingMode(.original)
                }
                .offset(y: -30)
            }
        }
    }
    
    func getUserLocation(){
        self.locationManager.startUpdatingLocation()
    }
}
