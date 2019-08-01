//
//  PriceView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/10/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct PriceView: View {
    
    @State private var ratio = 1.0
    @State private var showPrice = 0
    @State private var services: [Service] = [
        Service(id: 0, name: "به صرفه و فوری", type: "economic", image: "economic", ratio: 1, selected: true),
        Service(id: 1, name: "ویژه بانوان", type: "women", image: "women", ratio: 0.9),
        Service(id: 2, name: "موتور ویژه مرسولات", type: "deliver", image: "deliver", ratio: 1.1),
        Service(id: 3, name: "موتور ویژه مسافر", type: "bike", image: "bike", ratio: 1.2)
    ]
    
    private let mainPrice = Double.random(in: 100000...200000)
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(self.services) { service in
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
                Text("\(self.showPrice)").foregroundColor(.snappBackground).font(.custom("IRANSansMobileFaNum-Medium",size: 25))
                Spacer()
                Image(uiImage: UIImage()).resizable().frame(width:1).background(Color(red:168/255 ,green:168/255 , blue:168/255, opacity:1.0))
                Text("کد تخفیف؟").frame(width:85).foregroundColor(.snappForeground).font(.custom("IRANSansMobileFaNum-Bold",size: 16))
            }
            .frame(height: 45)
            
            HStack{
                Spacer()
                Text("درخواست اسنپ اکو")
                    .minimumScaleFactor(0.01)
                    .font(.custom("IRANSansMobileFaNum-Bold",size: 18))
                    .frame(width: UIScreen.main.bounds.width - 190, height: 55 + geometry.safeAreaInsets.bottom/2)
                    .background(Color.snappForeground).foregroundColor(.white)
                Spacer()
            }
            .background(Color.snappBackground)
        }
    }
    
    
    
    func changePrice(service: Service){
        var defaultServices: [Service] = []
        
        for defaultService in self.services {
            if defaultService.type == service.type {
                defaultServices.append(Service(id: defaultService.id, name: defaultService.name, type: defaultService.type, image: defaultService.image, ratio: defaultService.ratio, selected: true))
                self.ratio = service.ratio
                self.animatePrice(to: Int(self.mainPrice*self.ratio) / 1000 * 1000)
            } else {
                defaultServices.append(Service(id: defaultService.id, name: defaultService.name, type: defaultService.type, image: defaultService.image, ratio: defaultService.ratio, selected: false))
            }
        }
        
        self.services = defaultServices
    }
    
    func animatePrice(to: Int){
        self.showPrice = 0
        var i = 0
        DispatchQueue.global().async {
            while( i < to-5) {
                i = i+5
                DispatchQueue.main.async {
                    self.showPrice = i+5
                }
            }
        }
    }
}
