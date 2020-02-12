//
//  TagMenu.swift
//  EsoArmoury
//
//  Created by walnut on 9/3/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import Foundation
import SwiftUI

enum TagMenu: Int, CaseIterable {
//    var id: Int {
//        return self.rawValue
//    }
    //jewelry, weapons, 
    case light, medium, heavy, arena, craft, dungeon, monster, over, pvp, trial, unique, thieves
    
    func title() -> String {
        switch self {
        case .light:        return "Light Armor"
        case .medium:       return "Medium Armor"
        case .heavy:        return "Heavy Armor"
        case .arena:        return "Arena"
        case .craft:        return "Craftable"
        case .dungeon:      return "Dungeon"
        case .monster:      return "Monster Set"
        case .over:         return "Overland"
        case .pvp:          return "PvP"
        case .trial:        return "Trial"
        case .unique:       return "Unique"
        case .thieves:      return "Thieves Guild"
       }
    }
    
    func weightId() -> Int {
        switch self {
        case .light:         return 1003
        case .medium:        return 1004
        case .heavy:         return 1005
        case .arena:         return 2001
        case .craft:         return 2002
        case .dungeon:       return 2003
        case .monster:       return 2004
        case .over:          return 2005
        case .pvp:           return 2006
        case .trial:         return 2007
        case .unique:        return 2008
        case .thieves:       return 3001
        }
    }
    
    private func tabList(menu: ItemType) -> AnyView {
        AnyView(NavigationView { ArmorList() })
        //AnyView(NavigationView { ArmorList() })
            //(displayedArmorId: menu.id) } )
    }
    
    var contentView: AnyView {
        switch self {
        case .light:        return tabList(menu: weightData[2])
        case .medium:       return tabList(menu: weightData[3])
        case .heavy:        return tabList(menu: weightData[4])
        case .arena:        return tabList(menu: weightData[5])
        case .craft:        return tabList(menu: weightData[6])
        case .dungeon:      return tabList(menu: weightData[7])
        case .monster:      return tabList(menu: weightData[8])
        case .over:         return tabList(menu: weightData[9])
        case .pvp:          return tabList(menu: weightData[10])
        case .trial:        return tabList(menu: weightData[11])
        case .unique:       return tabList(menu: weightData[12])
        case .thieves:      return tabList(menu: weightData[13])
        }
    }
}
