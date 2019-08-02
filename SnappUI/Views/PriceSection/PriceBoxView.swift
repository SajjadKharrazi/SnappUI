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
    @State private var showPrice = 0
    
    var body: some View {
        VStack {
            ServiceListView(showPrice: $showPrice)
            PriceActionsView(showPrice: $showPrice)
            RequestSnappView(geometry: self.geometry)
        }
    }
}
