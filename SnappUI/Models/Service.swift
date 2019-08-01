//
//  Service.swift
//  SnappUI
//
//  Created by Sajjad Kharrazi on 5/10/1398 AP.
//  Copyright © 1398 AP Sajjad Kharrazi. All rights reserved.
//

import Foundation
import SwiftUI

struct Service: Identifiable {
    let id: Int
    let name: String
    let type: String
    let image: String
    var selected: Bool = false
}
