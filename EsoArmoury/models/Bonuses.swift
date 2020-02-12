//
//  Bonuses.swift
//  EsoArmoury
//
//  Created by walnut on 9/3/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI
import CoreLocation

struct BonusType: Hashable, Codable, Identifiable {
    var id: Int
    var type: String
    var color: String
    var armorId: Int
    var desc: String
}

func GetBonusData(id: Int) -> BonusType! {
    for (_, array) in bonusData.enumerated()
    {
        if (array.id == id)
        {
            return array
        }
    }
    return nil
}

//func bonusDesc(id: Int) -> BonusType {
//   for (_, array) in bonusData.enumerated()
//   {
//        if (array.id == id)
//           {
//               return array
//           }
//       }
//}
