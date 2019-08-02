//
//  LeadingNavigationBarView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct LeadingNavigationBarView: View {
    
    @Binding var state: SnappState
    @Binding var annotations: [Artwork]
    @Binding var location: CLLocationCoordinate2D
    
    var body: some View {
        HStack {
            if self.state == .destination {
                Button(action: {
                    self.location = CLLocationCoordinate2D(latitude: self.annotations.first!.coordinate.latitude, longitude: self.annotations.first!.coordinate.longitude)
                    self.state = .source
                    self.annotations.removeAll()
                }){
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                }
                .padding(.trailing,20)
            }
            Button(action: {
                if self.state == .price {
                    self.location = CLLocationCoordinate2D(latitude: self.annotations.last!.coordinate.latitude, longitude: self.annotations.last!.coordinate.longitude)
                    self.state = .destination
                    self.annotations.removeLast()
                }
            }){
                Image(systemName: self.state == .price ? "xmark" : "magnifyingglass")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
            }
        }
    }
}
