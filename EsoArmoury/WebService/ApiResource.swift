//
//  ApiResource.swift
//  EsoArmoury
//
//  Created by walnut on 2/28/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation

protocol ApiResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}

extension ApiResource {
    var url: URL {
        var components = URLComponents(string: "https://nickyhurst.com/api/")!
        components.path = methodPath
        return components.url!
    }
}

struct ArmorResouce: ApiResource {
    typealias ModelType = ExternalArmorJSON
    let methodPath = "ArmorItems.json"
}

struct BonusResouce: ApiResource {
    typealias ModelType = ExternalBonusJSON
    let methodPath = "ItemBonusOptions.json"
}

struct IconResouce: ApiResource {
    typealias ModelType = ExternalIconJSON
    let methodPath = "ItemIconListing.json"
}

struct WeightResouce: ApiResource {
    typealias ModelType = ExternalWeightJSON
    let methodPath = "ItemWeightInfo.json"
}
