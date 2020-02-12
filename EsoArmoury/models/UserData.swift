//
//  UserData.swift
//  EsoArmoury
//
//  Created by walnut on 8/27/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI
import Combine



final class UserData: ObservableObject {
    //@Published var displayedArmorId = weightData
    @Published var showAcquiredOnly = false
    @Published var showWantedOnly = false
    //@Published var armors = ArmorViewModel()
    @Published var armors = armorData
    @Published var armorList = armorDataExternal
    
    //@Published var bonuses = [BonusListEntry]()
    
    //@Published var data = NetworkingManager()
    
    @Published var isFavorite: [Desirable] = []
    @Published var isWanted: [Desirable] = []
    
    
    @Published var activeHead : [ActiveArmor] = []
    @Published var activeChest : [ActiveArmor] = []
    @Published var activeShoulder : [ActiveArmor] = []
    @Published var activeHand : [ActiveArmor] = []
    @Published var activeWaist : [ActiveArmor] = []
    @Published var activeLegs : [ActiveArmor] = []
    @Published var activeShoes : [ActiveArmor] = []
    @Published var activeNeck : [ActiveArmor] = []
    @Published var activeRing1 : [ActiveArmor] = []
    @Published var activeRing2 : [ActiveArmor] = []
    @Published var activeWeap1 : [ActiveArmor] = []
    @Published var activeWeap2 : [ActiveArmor] = []
    @Published var activeBackWeap1 : [ActiveArmor] = []
    @Published var activeBackWeap2 : [ActiveArmor] = []
    
    
//    @Published var activeSets: [[ActiveArmor]] = [
//        activeBackWeap1, activeBackWeap2, activeBackWeap2, activeChest, activeHand, activeHead, activeLegs, activeNeck, activeRing1, activeRing2, activeShoes, activeShoulder, activeWaist, activeWeap1, activeWeap2
//    ]
    
    //let activeHead[0] = ActiveArmor(armor: armorData[1], weightId: 1003, iconId: 300)
    
//    init(activeHead: [ActiveArmor] = [
//        ActiveArmor(armor: armorData[1], weightId: 1003, iconId: 300)
//        ])
//    }
    
//    init(activeShoulder: [ActiveArmor] = []) {
//        self.activeShoulder = activeShoulder
//    }
//    init(activeHand: [ActiveArmor] = []) {
//        self.activeHand = activeHand
//    }
//    init(activeWaist: [ActiveArmor] = []) {
//        self.activeWaist = activeWaist
//    }
//    init(activeLegs: [ActiveArmor] = []) {
//        self.activeLegs = activeLegs
//    }
//    init(activeShoes: [ActiveArmor] = []) {
//        self.activeShoes = activeShoes
//    }
//    init(activeNeck: [ActiveArmor] = []) {
//        self.activeNeck = activeNeck
//    }
//    init(activeRing1: [ActiveArmor] = []) {
//        self.activeRing1 = activeRing1
//    }
//    init(activeRing2: [ActiveArmor] = []) {
//        self.activeRing2 = activeRing2
//    }
//    init(activeWeap1: [ActiveArmor] = []) {
//        self.activeWeap1 = activeWeap1
//    }
//    init(activeWeap2: [ActiveArmor] = []) {
//        self.activeWeap2 = activeWeap2
//    }
//    init(activeBackWeap1: [ActiveArmor] = []) {
//        self.activeBackWeap1 = activeBackWeap1
//    }
//    init(activeBackWeap2: [ActiveArmor] = []) {
//        self.activeBackWeap2 = activeBackWeap2
//    }
}
//struct ActiveArmor: Decodable, Identifiable {
struct ActiveArmor: Hashable, Decodable, Identifiable {
    var id = UUID()
    var armor: Armor
    var weightId: Int
    var iconId: Int
}
