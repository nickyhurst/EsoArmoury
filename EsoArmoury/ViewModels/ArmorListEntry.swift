//
//  ArmorListEntry.swift
//  EsoArmoury
//
//  Created by walnut on 2/7/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation
import SwiftUI

struct ExternalArmorJSON: Decodable, Hashable {
    var updated: String
    var armorListData = Array<ArmorListData>()
}

struct ArmorListData: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String
    var type: String
    var location: String
    var dlc: String
    var min: String
    var max: String
    var isFavorite: Bool
    var isWanted: Bool
    //var armorTypes: String
    fileprivate var imageName: String
    var prefix: String
    var suffix: String
    var style: String
    var traits: String
    
    var armorTypes = Array<ArmorTypes>()
    var bonus = Array<Bonus>()
}

extension ArmorListData {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
