//
//  Armor.swift
//  EsoArmoury
//
//  Created by walnut on 8/20/19.
//  Copyright © 2019 walnut. All rights reserved.
//
import Foundation
import SwiftUI
import CoreLocation

struct Armor: Hashable, Decodable, Identifiable {
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
    //var weight = Array<Weight>()
    //private var bonusSet: [Bonus]
    
}

extension Armor {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
//
//extension Bonus {
//    var colorType: Color {
//    //var colorname = TextColor(rawValue: color)
//
//        enum TextColor:String {
//            case red
//            case blue
//            case primary
//
//            var create: Color {
//                switch self {
//                case .red: return Color.red
//                case .blue: return Color.blue
//                case .primary: return Color.primary
//                }
//            }
//        }
//        return Color.primary
//    }
//}

struct Availability: Hashable, Codable {
    var style: String
}

struct Bonus: Hashable, Codable {
    //var id = UUID()
    var items: String
    //var desc: String
    //var color: String
    var bonusId: Int
}


struct ArmorTypes: Hashable, Codable, Identifiable {
   var id: Int
}

