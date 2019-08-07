//
//  ServiceListView.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI

struct ServiceListView: View {
    
    @Binding var serviceViewModel: ServiceViewModel
    let mainPrice: Double
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(self.serviceViewModel.services) { service in
                    Button(action: {
                        self.selectService(service: service)
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
                self.selectService(service: self.serviceViewModel.services[0])
        }
    }
    
    private func selectService(service: Service){
        var defaultServices: [Service] = []
        
        for defaultService in self.serviceViewModel.services {
            if defaultService.type == service.type {
                defaultServices.append(Service(id: defaultService.id, name: defaultService.name, type: defaultService.type, image: defaultService.image, ratio: defaultService.ratio, selected: true))
            } else {
                defaultServices.append(Service(id: defaultService.id, name: defaultService.name, type: defaultService.type, image: defaultService.image, ratio: defaultService.ratio, selected: false))
            }
        }
        
        self.serviceViewModel.services = defaultServices
        self.animatePrice()
    }
    
    private func animatePrice() -> Int{
        let to = self.serviceViewModel.calculatePrice(mainPrice: self.mainPrice)
        self.serviceViewModel.showPrice = 0
        var i = 0
        DispatchQueue.global().async {
            while( i < to-10) {
                DispatchQueue.main.async {
                    self.serviceViewModel.showPrice = i+10
                }
                i = i+10
            }
        }
        return 2
    }
}
