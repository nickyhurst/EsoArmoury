//
//  Data.swift
//  EsoArmoury
//
//  Created by walnut on 8/20/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation
import Foundation

//let armorDataExternal: [ArmorListData] = NetworkingManager().armor
//let weightDataExternal: [WeightType] = NetworkingManager().weights
//let iconDataExternal: [IconsList] = NetworkingManager().iconList

//let armorData = ArmorViewModel()
let armorData: [Armor] = LoadBundleMainFile("eso-armor.json")
//let internalArmor: [InitialArmor] = loadInternal("ArmorItems.json")
//let armorData: [Armor] = internalArmor[0].armorListData

//let armorData: [Armor] = loadInternal("ArmorItems.json")

let weightData: [ItemType] = LoadBundleMainFile("itemTypes.json")

let bonusData: [BonusType] = LoadBundleMainFile("bonus.json")

let iconData: [IconsType] = LoadBundleMainFile("armorImageNames.json")

func LoadBundleMainFile<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func GetApplicationsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
   return paths[0]
}

func LoadAppPathFile<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    let file = GetApplicationsDirectory().appendingPathComponent(filename)

    do {
        data = try Data(contentsOf: file)
        //print(data)
    } catch {
        fatalError("Couldn't load \(file) from FileManger:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(file) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(verbatim: name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).png from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
