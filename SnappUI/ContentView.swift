//
//  ContentView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 6/14/19.
//  Copyright © 2019 Sajjad Kharrazi. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView : View {
    
    @ObjectBinding var mapCenter = MapViewModel(center: CLLocationCoordinate2D(latitude: 35.729255, longitude: 51.352264))
    @State private var annotations: [Artwork] = []
    @State private var state: SnappState = .source
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    MapBoxView(mapCenter: self.mapCenter, annotations: self.$annotations, state: self.$state)
                    if self.state != .price {
                        InformationBoxView(state: self.$state, geometry: geometry)
                    }
                    if self.state == .price {
                        PriceBoxView(geometry: geometry)
                    }
                }
            }
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle(Text(self.state == .source ? "کجا هستید؟" : "کجا می‌روید؟"), displayMode: .inline)
                .navigationBarItems(
                    leading: LeadingNavigationBarView(state: self.$state, annotations: self.$annotations, mapCenter: self.mapCenter),
                    trailing: Image(systemName: "line.horizontal.3").font(.system(size: 25))
            )
        }
        .font(.custom("IRANSansMobileFaNum",size: 16))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
