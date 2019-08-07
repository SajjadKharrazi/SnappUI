//
//  PriceView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/10/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct PriceBoxView: View {
    
    let geometry: GeometryProxy
    let mainPrice = Double.random(in: 100000...200000)
    
    @State var serviceViewModel = ServiceViewModel()
    
    var body: some View {
        VStack {
            ServiceListView(serviceViewModel: self.$serviceViewModel, mainPrice: self.mainPrice)
            PriceActionsView(serviceViewModel: self.$serviceViewModel)
            RequestSnappView(geometry: self.geometry)
        }
    }
}
