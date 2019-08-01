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

struct Result {
    var id = UUID()
    var score: Int
}

struct ContentView : View {
    
    @State var locationManager = CLLocationManager()
    @State var location = CLLocationCoordinate2D(latitude: 35.729255, longitude: 51.352264)
    @State private var annotations: [Artwork] = []
    @State private var showDestinationMarker = false
    @State private var showSourceMarker = true
    @State private var isUserInteractionEnabled = true
    @State private var state: SnappState = .source
    
    @State private var services: [Service] = [
        Service(id: 0, name: "به صرفه و فوری", type: "economic", image: "economic", selected: true),
        Service(id: 1, name: "ویژه بانوان", type: "women", image: "women"),
        Service(id: 2, name: "موتور ویژه مرسولات", type: "deliver", image: "deliver"),
        Service(id: 3, name: "موتور ویژه مسافر", type: "bike", image: "bike")
    ]
    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
    
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
//                    VStack {
//                        ForEach(results.identified(by: \.id)) { result in
//                            Button(action: {
//                                print(result.score)
//                                //                                print("\(result.name)")
//                                //                                self.state = .price
//                                //                                self.annotations.append(Artwork(coordinate: self.location, tag: .destination))
//                            }){
//                                Text("\(result.score)")
//                                //                                print(result.name)
//                                //                                VStack {
//                                //                                    Image("women").renderingMode(.original).resizable().frame(width:110, height:110).padding(4).border(Color.black, width: 4, cornerRadius: 200)
//                                //                                    Text(result.name).foregroundColor(.black)
//                                //                                }
//                            }
//                            .padding(16)
//                            Text("Result: \(result.score)")
//                        }
//                    }
                    VStack {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                ForEach(services) { service in
                                    Button(action: {
                                        self.changePrice(service: service)
                                    }){
                                        ServiceView(service: service)
                                    }
                                    .padding(16)
                                }
                            }
                            .padding(16)
                        }
                        .frame(height: 175)
                        
                        HStack{
                            Text("گزینه‌ها").frame(width:85).foregroundColor(.snappForeground).font(.custom("IRANSansMobileFaNum-Bold",size: 16))
                            Image(uiImage: UIImage()).resizable().frame(width:1).background(Color(red:168/255 ,green:168/255 , blue:168/255, opacity:1.0))
                            Spacer()
                            Text("ریال").foregroundColor(.snappTextDisabled)
                            Text("۱۱۵,۰۰۰").foregroundColor(.snappBackground).font(.custom("IRANSansMobileFaNum-Medium",size: 25))
                            Spacer()
                            Image(uiImage: UIImage()).resizable().frame(width:1).background(Color(red:168/255 ,green:168/255 , blue:168/255, opacity:1.0))
                            Text("کد تخفیف؟").frame(width:85).foregroundColor(.snappForeground).font(.custom("IRANSansMobileFaNum-Bold",size: 16))
                        }
                        .frame(height: 45)
                        
                        HStack{
                            Spacer()
                            Text("درخواست اسنپ اکو")
                                .font(.custom("IRANSansMobileFaNum-Bold",size: 18))
                                .frame(width: UIScreen.main.bounds.width - 190, height: 55)
                                .background(Color.snappForeground).foregroundColor(.white)
                            Spacer()
                        }
                        .background(Color.snappBackground)
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
    
    func changePrice(service: Service){
        var defaultServices: [Service] = []
        
        for defaultService in self.services {
            if defaultService.type == service.type {
                defaultServices.append(Service(id: defaultService.id, name: defaultService.name, type: defaultService.type, image: defaultService.image, selected: true))
            } else {
                defaultServices.append(Service(id: defaultService.id, name: defaultService.name, type: defaultService.type, image: defaultService.image, selected: false))
            }
        }
        
        self.services = defaultServices
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
