//
//  Icons.swift
//  EsoArmoury
//
//  Created by walnut on 9/3/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI
import CoreLocation


struct IconsType: Hashable, Codable, Identifiable {
    var id: Int
    var icons = Array<IconArray>()
}

struct IconArray: Hashable, Codable, Identifiable {
    var id: Int
    var image_name: String
}


