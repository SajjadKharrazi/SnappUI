//
//  FavoritePlace.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/11/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct FavoritePlace: Identifiable {
    let id: Int
    let name: String
    let coordinate: CLLocationCoordinate2D
}
