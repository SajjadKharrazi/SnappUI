//
//  MapViewModel.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/12/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

class MapViewModel: BindableObject {
    var willChange = PassthroughSubject<Void, Never>()
    
    var center: CLLocationCoordinate2D
    
    init(center: CLLocationCoordinate2D) {
        self.center = center
    }
}

