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

enum SnappState {
    case source
    case destination
    case price
}

struct ContentView : View {
    
    @State var locationManager = CLLocationManager()
    @State var location = CLLocationCoordinate2D(latitude: 35.729255, longitude: 51.352264)
    @State private var annotations: [Artwork] = []
    @State private var showDestinationMarker = false
    @State private var showSourceMarker = true
    @State private var isUserInteractionEnabled = true
    @State private var state: SnappState = .source
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    ZStack(alignment: .bottomTrailing) {
                        MapView(locationManager: $locationManager, userLocation: $location, annotations: $annotations, state: $state)
                        if self.state != .price {
                            Button(action: {
                                self.getUserLocation()
                            }){
                                Image(systemName: "location.fill")
                                    .frame(width: 60, height: 60)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .clipShape(Circle())
                                    .shadow(radius: 2, x:0, y: 3)
                                    .offset(x: -30, y: -30)
                            }
                        }
                    }
                    if self.state == .source {
                        Button(action: {
                            self.state = .destination
                            self.annotations.append(Artwork(coordinate: self.location, tag: .source))
                        }){
                            Image("sourceMarker")
                                .renderingMode(.original)
                        }
                            .offset(y: -30)
                    }
                    if self.state == .destination {
                        Button(action: {
                            self.state = .price
                            self.annotations.append(Artwork(coordinate: self.location, tag: .destination))
                        }){
                            Image("destinationMarker")
                                .renderingMode(.original)
                        }
                            .offset(y: -30)
                    }
                }
                if self.state == .price {
                    VStack {
                        Text(!self.showDestinationMarker ? "۱۶ اسنپ موجود" : "مبدا:")
                        ZStack {
                            Image(systemName: "video")
                                .frame(width: 35)
                                .background(Color.white)
                        }
                            .frame(width:300, height: 2)
                            .background(Color.gray)
                        Text(!self.showDestinationMarker ? "مبدا:" : "مقصد:" )
                    }
                        .frame(height: 80)
                        .padding(10)
                }
                if self.state != .price {
                    VStack {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                VStack {
                                    Image("economic").resizable().frame(width:110, height:110).padding(4).border(Color.black, width: 4, cornerRadius: 200)
                                    Text("به صرفه و فوری")
                                }
                                .padding(16)
                                VStack {
                                    Image("women").resizable().frame(width:110, height:110).padding(4).border(Color(red:242/255 ,green:242/255 , blue:242/255, opacity:1.0), width: 4, cornerRadius: 100)
                                    Text("ویژه بانوان").foregroundColor(Color(red:168/255 ,green:168/255 , blue:168/255, opacity:1.0))
                                }
                                .padding(16)
                                VStack {
                                    Image("deliver").resizable().frame(width:110, height:110).padding(4).border(Color(red:242/255 ,green:242/255 , blue:242/255, opacity:1.0), width: 4, cornerRadius: 100)
                                    Text("موتور ویژه مرسولات").foregroundColor(Color(red:168/255 ,green:168/255 , blue:168/255, opacity:1.0))
                                }
                                .padding(16)
                                VStack {
                                    Image("bike").resizable().frame(width:110, height:110).padding(4).border(Color(red:242/255 ,green:242/255 , blue:242/255, opacity:1.0), width: 4, cornerRadius: 100)
                                    Text("موتور ویژه مسافر").foregroundColor(Color(red:168/255 ,green:168/255 , blue:168/255, opacity:1.0))
                                }
                                .padding(16)
                            }
                            .padding(16)
                        }
                        .frame(height: 175)
                        
                        HStack{
                            Text("گزینه‌ها").frame(width:85)
                            Image(uiImage: UIImage()).resizable().frame(width:1).background(Color(red:168/255 ,green:168/255 , blue:168/255, opacity:1.0))
                            Spacer()
                            Text("۱۱,۵۰۰")
                            Spacer()
                            Image(uiImage: UIImage()).resizable().frame(width:1).background(Color(red:168/255 ,green:168/255 , blue:168/255, opacity:1.0))
                            Text("کد تخفیف؟").frame(width:85)
                        }
                            .frame(height: 55)
                        
                        HStack{
                            Spacer()
                            Text("درخواست اسنپ اکو")
                                .frame(width: UIScreen.main.bounds.width - 190, height: 55)
                                .background(Color(red:0/255 ,green:209/255 , blue:112/255, opacity:1.0)).foregroundColor(.white)
                            Spacer()
                        }
                            .background(Color(red:21/255 ,green:31/255 , blue:51/255, opacity:1.0))
                    }
                }
            }
                .navigationBarTitle(Text(!self.showDestinationMarker ? "کجا هستید؟" : "کجا می‌روید؟"), displayMode: .inline)
                .navigationBarItems(
                    leading:
                    HStack {
                        if self.state == .destination {
                            Button(action: {
                                self.location = CLLocationCoordinate2D(latitude: self.annotations.first!.coordinate.latitude, longitude: self.annotations.first!.coordinate.longitude)
                                self.state = .source
                                self.annotations.removeAll()
                            }){
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25))
                                }
                                .padding(.trailing,20)
                        }
                        Button(action: {
                            if self.state == .price {
                                self.location = CLLocationCoordinate2D(latitude: self.annotations.last!.coordinate.latitude, longitude: self.annotations.last!.coordinate.longitude)
                                self.state = .destination
                                self.annotations.removeLast()
                            }
                        }){
                            Image(systemName: self.state == .price ? "xmark" : "magnifyingglass")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                        }
                    },
                    trailing: Image(systemName: "line.horizontal.3").font(.system(size: 25))
                )
        }
            .font(.custom("IRANSansMobileFaNum",size: 16))
    }
    
    func getUserLocation(){
        self.locationManager.startUpdatingLocation()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
