//
//  NetworkingManager.swift
//  EsoArmoury
//
//  Created by walnut on 2/6/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class NetworkingManager : ObservableObject {
    
    @Published var bonuses = [BonusListEntry]()
    @Published var armor = [ArmorListData]()
    @Published var weights = [WeightType]()
    @Published var iconList = [IconsList]()
    
    init() {
        loadBonuses()
        loadArmor()
        loadWeights()
        loadIcons()
    }
    
    func loadBonuses() {
        guard let url = URL(string: "https://www.nickyhurst.com/api/bonus.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([BonusListEntry].self, from: d)
                    DispatchQueue.main.async {
                        self.bonuses = decodedLists
                        //print("loadBonuses")
                        //print(decodedLists.count)
                    }
                } else {
                    print("NO DATA")
                }
            } catch {
                print("ERROR")
            }
        }.resume()
    }
    func loadArmor() {
        guard let url = URL(string: "https://nickyhurst.com/api/eso-armor.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([ArmorListData].self, from: d)
                    DispatchQueue.main.async {
                        self.armor = decodedLists
                        //print("loadArmor")
                        //print(decodedLists.count)
                    }
                } else {
                    print("NO DATA")
                }
            } catch {
                print("ERROR")
            }
        }.resume()
    }
    func loadWeights() {
        guard let url = URL(string: "https://nickyhurst.com/api/itemTypes.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([WeightType].self, from: d)
                    DispatchQueue.main.async {
                        self.weights = decodedLists
                        print("loadWeights")
                        print(decodedLists.count)
                    }
                } else {
                    print("NO DATA")
                }
            } catch {
                print("ERROR")
            }
        }.resume()
    }
    
    
    
    func loadIcons() {
        guard let url = URL(string: "https://www.nickyhurst.com/api/armorImageNames.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([IconsList].self, from: d)
                    DispatchQueue.main.async {
                        self.iconList = decodedLists
                        print("loadIcons")
                        print(decodedLists[0].icons[0].image_name)
                    }
                } else {
                    print("NO DATA")
                }
            } catch {
                print("ERROR")
            }
        }.resume()
    }
    
}
