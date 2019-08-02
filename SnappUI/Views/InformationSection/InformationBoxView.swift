//
//  InformationView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct InformationBoxView: View {
    
    @Binding var state: SnappState
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            Text(self.state == .source ? "۱۶ اسنپ موجود" : "مبدا:").animation(.easeIn(duration: 0.5))
            ZStack {
                Image(systemName: "video")
                    .frame(width: 35)
                    .foregroundColor(.snappForeground)
                    .background(Color.white)
            }
            .frame(width:300, height: 2)
                .background(Color.snappTextDisabled)
            Text(self.state == .source ? "مبدا:" : "مقصد:" ).animation(.easeIn(duration: 0.5))
        }
            .frame(height: 80 + geometry.safeAreaInsets.bottom/2)
            .padding(10)
    }
    
}
