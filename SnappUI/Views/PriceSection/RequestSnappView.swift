//
//  RequestSnappView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct RequestSnappView: View {
    
    @Binding var serviceViewModel: ServiceViewModel
    let geometry: GeometryProxy
    
    var body: some View {
        HStack{
            Spacer()
            Text("\(self.serviceViewModel.services.first(where: {$0.selected})!.buttonName)")
                .minimumScaleFactor(0.01)
                .font(.custom("IRANSansMobileFaNum-Bold",size: 18))
                .frame(width: UIScreen.main.bounds.width - 190, height: 55 + geometry.safeAreaInsets.bottom/2)
                .background(Color.snappForeground).foregroundColor(.white).animation(.easeInOut)
            Spacer()
        }
        .background(Color.snappBackground)
    }
}
