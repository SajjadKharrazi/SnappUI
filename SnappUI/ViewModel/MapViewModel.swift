//
//  MapViewModel.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/12/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import SwiftUI
import Combine

class Snapp: BindableObject {
    
    var willChange = PassthroughSubject<Void, Never>()

    var state: SnappState = .source {
        willSet {
            willChange.send(())
        }
    }
}
