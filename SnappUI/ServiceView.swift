//
//  ServiceView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/10/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct ServiceView: View {
    
    let service: Service
    
    var body: some View {
        VStack {
            Image(service.image)
                .renderingMode(.original)
                .resizable()
                .frame(width:110, height:110)
                .padding(4)
                .border(service.selected ? Color.black : Color.snappImageDisabled, width: 4, cornerRadius: 200)
            Text("\(service.name)").foregroundColor(service.selected ? .black : .snappTextDisabled)
        }
    }
}
