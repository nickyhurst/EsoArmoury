//
//  Desirable.swift
//  EsoArmoury
//
//  Created by walnut on 2/11/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation
import SwiftUI



struct Desirable: Codable, Hashable, Identifiable {
    var id = UUID()
    var armorId: Int
    var type: String
}

final class DesirableOptions {
    static var shared = DesirableOptions()
    
    func isDesirable(armorId: Int, type: String, data: UserData) -> Bool {
        let fav = data.isFavorite.firstIndex(where: { $0.armorId == armorId && $0.type == type} )
        return fav != nil
    }

    func setStatus(armorId: Int, type: String, data: UserData) {
        if (isDesirable(armorId: armorId, type: type, data: data)) {
            data.isFavorite.removeAll(where: {$0.armorId == armorId && $0.type == type})
        } else {
            data.isFavorite.insert(Desirable(armorId: armorId, type: type), at: data.isFavorite.endIndex)
        }
    }
}

