//
//  ActiveSets.swift
//  EsoArmoury
//
//  Created by walnut on 1/22/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI
import Combine

//public struct ActiveSets {
//    internal let items: [ActiveArmor]
//
//    private init(items: [ActiveArmor]) {
//        self.items = items
//    }
//}

struct ActiveSets: Hashable, Identifiable {
    var id = UUID()
    var activeBackWeap1: [ActiveArmor]
    var activeBackWeap2: [ActiveArmor]
    var activeChest: [ActiveArmor]
    var activeHand: [ActiveArmor]
    var activeHead: [ActiveArmor]
    var activeLegs: [ActiveArmor]
    var activeNeck: [ActiveArmor]
    var activeRing1: [ActiveArmor]
    var activeRing2: [ActiveArmor]
    var activeShoes: [ActiveArmor]
    var activeShoulder: [ActiveArmor]
    var activeWaist: [ActiveArmor]
    var activeWeap1: [ActiveArmor]
    var activeWeap2: [ActiveArmor]
}
