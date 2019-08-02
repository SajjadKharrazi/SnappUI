//
//  ServiceListView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct ServiceListView: View {
    
    @State private var services: [Service] = [
        Service(id: 0, name: "به صرفه و فوری", type: "economic", image: "economic", ratio: 1, selected: true),
        Service(id: 1, name: "ویژه بانوان", type: "women", image: "women", ratio: 0.9),
        Service(id: 2, name: "موتور ویژه مرسولات", type: "deliver", image: "deliver", ratio: 1.1),
        Service(id: 3, name: "موتور ویژه مسافر", type: "bike", image: "bike", ratio: 1.2)
    ]
    @State private var ratio = 1.0
    @Binding var showPrice: Int
    
    private let mainPrice = Double.random(in: 100000...200000)
    
    var body: some View {
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
            .onAppear {
                self.changePrice(service: self.services[0])
        }
    }
    
    private func changePrice(service: Service){
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
    
    private func animatePrice(to: Int){
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
