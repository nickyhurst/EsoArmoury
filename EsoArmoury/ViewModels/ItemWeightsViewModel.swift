//
//  ItemWeightsViewModel.swift
//  EsoArmoury
//
//  Created by walnut on 2/10/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation
import SwiftUI

struct WeightType : Hashable, Decodable, Identifiable {
    var id: Int
    var weight: String
    var desc: String
    fileprivate var imageName: String
    var subText: String
}

//extension ItemType {
//    var image: Image {
//        ImageStore.shared.image(name: imageName)
//    }
//}
