//
//  Artwork.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 4/8/1398 AP.
//  Copyright © 1398 Sajjad Kharrazi. All rights reserved.
//

import Foundation
import MapKit

enum ArtworkTag: String {
    case source
    case destination
}

class Artwork: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let tag: ArtworkTag
    
    init(coordinate: CLLocationCoordinate2D, tag: ArtworkTag) {
        self.coordinate = coordinate
        self.tag = tag
        super.init()
    }
}
