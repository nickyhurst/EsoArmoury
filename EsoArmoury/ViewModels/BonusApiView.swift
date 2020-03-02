//
//  BonusApiView.swift
//  EsoArmoury
//
//  Created by walnut on 2/6/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation
import SwiftUI

//struct BonusApiList: Codable{
//    var results: [BonusListEntry]
//}

struct ExternalBonusJSON: Decodable, Hashable {
    var updated: String
    var bonusListData = Array<BonusListEntry>()
}


struct BonusListEntry: Decodable, Hashable{
    var id : Int
    var type: String
    var armorId: Int
    var color : String
    var desc : String
}
