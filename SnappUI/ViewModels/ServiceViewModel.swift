//
//  ServiceViewModel.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/16/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI
import Combine

class ServiceViewModel: BindableObject {
    var willChange = PassthroughSubject<Void, Never>()
    
    var services: [Service] = [
        Service(id: 0, name: "به صرفه و فوری", type: "economic", image: "economic", buttonName: "درخواست اسنپ اکو", ratio: 1, selected: true),
        Service(id: 1, name: "ویژه بانوان", type: "women", image: "women", buttonName: "درخواست اسنپ رُز", ratio: 0.9),
        Service(id: 2, name: "موتور ویژه مرسولات", type: "deliver", image: "deliver", buttonName: "وارد کردن جزییات", ratio: 1.1),
        Service(id: 3, name: "موتور ویژه مسافر", type: "bike", image: "bike", buttonName: "درخواست اسنپ بایک", ratio: 1.2)
    ] {
        willSet {
            willChange.send()
        }
    }
    
    var showPrice: Int = 0 {
        willSet {
            willChange.send()
        }
    }
    
    func calculatePrice(mainPrice: Double) -> Int {
        
        guard let serviceSelected = self.services.first(where: {$0.selected}) else { return 0 }
        return Int(mainPrice*serviceSelected.ratio) / 1000 * 1000
    }
}
