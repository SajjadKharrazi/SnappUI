//
//  Favorite.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var annotations: [Artwork]
    @Binding var state: SnappState
    let favorite: FavoritePlace
    
    var body: some View {
        Button(action: {
            self.state = .price
            self.annotations.append(Artwork(coordinate: self.favorite.coordinate, tag: .destination))
        }){
            HStack{
                Image(systemName: "star.fill").foregroundColor(.snappForeground)
                Text(self.favorite.name).foregroundColor(.black).offset(x: -5, y:1)
            }
        }
    }
}
