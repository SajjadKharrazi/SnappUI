//
//  FavoriteBoxView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI
import MapKit

struct FavoriteBoxView: View {
    
    @Binding var annotations: [Artwork]
    @Binding var state: SnappState
    @State private var favorites: [FavoritePlace] = [
        FavoritePlace(id: 0, name: "خانه", coordinate: CLLocationCoordinate2D(latitude: 35.709232, longitude: 51.320822)),
        FavoritePlace(id: 1, name: "شرکت", coordinate: CLLocationCoordinate2D(latitude: 35.7733608, longitude: 51.4182717)),
        FavoritePlace(id: 2, name: "زاویه", coordinate: CLLocationCoordinate2D(latitude: 35.6998313, longitude: 51.3192615)),
        FavoritePlace(id: 3, name: "انقلاب", coordinate: CLLocationCoordinate2D(latitude: 35.700924, longitude: 51.391022)),
        FavoritePlace(id: 4, name: "دریاچه", coordinate: CLLocationCoordinate2D(latitude: 35.743439, longitude: 51.222641)),
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                Spacer()
            }
            .frame(height:51)
                .background(Color.snappTextDisabled)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(self.favorites) { favorite in
                        Button(action: {
                            print("\(favorite.coordinate.latitude)")
                        }){
                            FavoriteView(annotations: self.$annotations, state: self.$state,favorite: favorite)
                        }
                        .padding(.trailing,48)
                            .padding(.leading,16)
                    }
                    HStack{
                        Image(systemName: "plus").foregroundColor(.snappForeground)
                        Text("افزودن آدرس منتخب").foregroundColor(.black).offset(x: -5, y:1)
                    }
                    .padding(.trailing,48)
                        .padding(.leading,16)
                    
                }
            }
            .frame(height: 50)
                .background(Color.white)
            
            //        .transition(.move(edge: .top))
            //        .animation(.spring())
        }
    }
}
