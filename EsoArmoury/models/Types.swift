//
//  Types.swift
//  EsoArmoury
//
//  Created by walnut on 8/23/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI
import CoreLocation
import UIKit

struct ItemType: Hashable, Codable, Identifiable {
    var id: Int
    var weight: String
    var desc : String
    fileprivate var imageName: String
    var subText: String
}

extension ItemType {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

func weightName(id: Int) -> String {
       for (_, array) in weightData.enumerated()
       {
           if (array.id == id)
           {
               return array.weight
           }
       }
   return ""
}

func GetWeightData(id: Int) -> ItemType! {
    for (_, array) in weightData.enumerated()
    {
        if (array.id == id)
        {
            return array
        }
    }
    return nil
}


func GetIconsFromWeightId(id: Int) -> IconsType? {
    return iconData.filter({ $0.id == id }).first
    
}
func GetIconNameFromWeightId(id: Int, icons: IconsType) -> String {
    return icons.icons.filter({ $0.id == id}).first!.image_name
}

func GetIconWeightName(weightId: Int, itemId: Int) -> String {
    let icons = GetIconsFromWeightId(id: weightId)
    let imageName = GetIconNameFromWeightId(id: itemId, icons: icons!)
    return imageName
}

func ColorNSText(text: String, target: String, color: Color) -> NSMutableAttributedString {
    
    let range = (text as NSString).range(of: target)
    let attribute = NSMutableAttributedString.init(string: text)
    attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    
    let label = UILabel()
    label.attributedText = attribute
    return attribute
}
