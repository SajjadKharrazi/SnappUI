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
            ZStack(alignment: self.state == .source ? .bottomTrailing : .top) {
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
                } else if self.state == .destination {
                    FavoriteBoxView(annotations: self.$annotations, state: self.$state)
                }
            }
            if self.state == .source {
                self.sourceMarker
            } else if self.state == .destination {
                self.destinationMarker
            }
        }
    }
    
    
    private var sourceMarker: some View {
        Button(action: {
            self.state = .destination
            self.annotations.append(Artwork(coordinate: self.location, tag: .source))
            self.location = CLLocationCoordinate2D(latitude: self.location.latitude * 1.0000237784, longitude: self.location.longitude * 1.0000237784)
        }){
            Image("sourceMarker")
                .renderingMode(.original)
        }
        .offset(y: -30)
    }
    
    private var destinationMarker: some View {
        Button(action: {
            self.state = .price
            self.annotations.append(Artwork(coordinate: self.location, tag: .destination))
        }){
            Image("destinationMarker")
                .renderingMode(.original)
        }
        .offset(y: -30)
    }
    
    func getUserLocation(){
        self.locationManager.startUpdatingLocation()
    }
}
