//
//  ContentMenu.swift
//  EsoArmoury
//
//  Created by walnut on 9/5/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import Foundation
import SwiftUI

enum ContentTypeMenu: Int, CaseIterable {
    case arena, craft, dungeon
    
    func title() -> String {
        switch self {
        case .arena:        return "Arena"
        case .craft:        return "Craftable"
        case .dungeon:      return "Dungeon"
        }
    }
    
    func weightId() -> Int {
        switch self {
        case .arena:         return 2001
        case .craft:         return 2002
        case .dungeon:       return 2003
        }
    }
    
    private func tabList(menu: ItemType) -> AnyView {
        //AnyView(NavigationView { ArmorList() })
        AnyView(NavigationView { ArmorList() })
    }
    
    var contentView: AnyView {
        switch self {
        case .arena:        return tabList(menu: weightData[5])
        case .craft:        return tabList(menu: weightData[6])
        case .dungeon:      return tabList(menu: weightData[7])
        }
    }
}
