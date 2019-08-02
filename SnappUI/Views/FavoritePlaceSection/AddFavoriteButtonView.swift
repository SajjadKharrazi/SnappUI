//
//  AddFavoriteButtonView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct AddFavoriteButtonView: View {
    var body: some View {
        
        HStack{
            Image(systemName: "plus").font(Font.title.weight(.medium)).foregroundColor(.snappForeground)
            Text("افزودن آدرس منتخب").foregroundColor(.black).offset(x: -5, y:1)
        }
        .padding(.trailing,48)
            .padding(.leading,16)
    }
}
