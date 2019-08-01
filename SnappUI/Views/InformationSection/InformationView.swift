//
//  InformationView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct InformationView: View {
    
    @Binding var state: SnappState
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            Text(self.state == .source ? "۱۶ اسنپ موجود" : "مبدا:")
            ZStack {
                Image(systemName: "video")
                    .frame(width: 35)
                    .foregroundColor(.snappForeground)
                    .background(Color.white)
            }
            .frame(width:300, height: 2)
                .background(Color.snappTextDisabled)
            Text(self.state == .source ? "مبدا:" : "مقصد:" )
        }
            .frame(height: 80 + geometry.safeAreaInsets.bottom/2)
            .padding(10)
    }
    
}
