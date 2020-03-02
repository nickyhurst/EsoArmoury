//
//  IconListViewModel.swift
//  EsoArmoury
//
//  Created by walnut on 2/11/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation

struct ExternalIconJSON: Decodable, Hashable {
    var updated: String
    var iconListData = Array<IconsList>()
}

struct IconsList: Codable, Hashable, Identifiable{
    var id: Int
    var icons = Array<IconItemView>()
}

struct IconItemView: Hashable, Codable, Identifiable {
    var id: Int
    var image_name: String
}
