//
//  WebService.swift
//  EsoArmoury
//
//  Created by walnut on 2/4/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation

class WebService {
    
    func getBonusData(completion: @escaping ([BonusListEntry]) -> ()) {
        guard let url = URL(string: "https://www.nickyhurst.com/api/bonus.json")
        else {
            print("ERROR JSON")
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let bon = try! JSONDecoder().decode([BonusListEntry].self, from: data!)
            DispatchQueue.main.async {
                completion(bon)
            }
        }.resume()
    }
    
    func getArmorData(completion: @escaping([ArmorListData]) -> ()) {
        guard let url = URL(string: "https://nickyhurst.com/api/eso-armor.json")
        else {
            print("ERROR Armor json")
            fatalError("URL is not correct!")
        }
        
            URLSession.shared.dataTask(with: url) { data, _, _ in
                let armor = try! JSONDecoder().decode([ArmorListData].self, from: data!)
                DispatchQueue.main.async {
                    completion(armor)
                }
            
        }
    }
}
