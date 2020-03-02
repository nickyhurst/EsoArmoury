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


class NetworkingManager : ObservableObject {
    @Published var bonuses = [BonusListEntry]()
    @Published var armor = [ArmorListData]()
    @Published var weights = [WeightType]()
    @Published var iconList = [IconsList]()
    static var obtainedArmor = 0
    
    init() {
        let domain = "https://nickyhurst.com/api/"
        loadBonuses(domain: domain)
        loadArmor(domain: domain)
        loadWeights(domain: domain)
        loadIcons(domain: domain)
        NetworkingManager.obtainedArmor += 1
    }
    
    
//    func load<T>(url:URL, withCompletion completion: @escaping (T?) -> Void) {
//        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
//        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
//            if let error = error {
//               DispatchQueue.main.async {
//                completion() (.failure(error))
//               }
//               return
//           }
//
//            guard let data = data else {
//                completion(nil)
//                return
//            }
//            // Use the Resource struct to parse data
//        })
//        task.resume()
//    }
//
//
    
//    func load2<T>(resource: Resource<T>, withCompletion completion: @escaping (T?) -> Void) {
//        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
//        let task = session.dataTask(with: resource.url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
//            guard let data = data else {
//                completion(nil)
//                return
//            }
//            // Use the Resource struct to parse data
//        })
//        task.resume()
//    }
//    func loadJson<T>(url: URL, withCompletion completion: @escaping (T?) -> Void) {
//        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
//        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
//            guard let data = data else {
//                completion(nil)
//                return
//            }
//            switch T.self {
//                case is BonusListEntry.Type:
//                    let json = try? JSONDecoder().decode([BonusListEntry].self, from: data)
//                    completion(json as? T)
//                case is ArmorListData.Type:
//                    let json = try? JSONDecoder().decode([ArmorListData].self, from: data)
//                    completion(json as? T)
//                case is WeightType.Type:
//                    let json = try? JSONDecoder().decode([WeightType].self, from: data)
//                    completion(json as? T)
//                case is IconsList.Type:
//                let json = try? JSONDecoder().decode([IconsList].self, from: data)
//                completion(json as? T)
//                default: break
//            }
//        })
//        task.resume()
//    }
    
//    func ReadJson<T: Decodable>(url: URL, completion: @escaping (Result<T?, Error>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//                return
//            }
//
//            do {
//                if let d = data {
//                    let results = try? JSONDecoder().decode(T.self, from: d) as T
//                    DispatchQueue.main.async {
//                        completion(.success(results))
//                    }
//                } else {
//                    print("NO DATA - bonuses")
//                }
//            }
//                //catch {
////                print("Failed to decode bonuses - JSON :", error)
////            }
//        }.resume()
//        //return
//    }
    
    
//    func ReadJson<T: Decodable>(url: URL, published : inout T, as type: T.Type = T.self) {
//        //var dataType = [T]()
//        let download = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            print(response!)
//            if error != nil {
//                print(error!)
//                return
//            }
//            do {
//                published = try JSONDecoder().decode(type.self, from: data!) as T
//                //print(json)
//            } catch {
//                print("Error during JSON serialization : \(error.localizedDescription)")
//            }
//        }
//        return download.resume()
//    }
    
    func loadBonuses(domain : String) {
        let fileName = "ItemBonusOptions.json"
        var fileType = [ExternalBonusJSON]()
        
        print("Load Bonuses")
        print(NetworkingManager.obtainedArmor)
        if (NetworkingManager.obtainedArmor == 0) {
            //print("Getting Bonus List")
            guard let url = URL(string: "\(domain)\(fileName)") else { return }
            let dataType = [ExternalBonusJSON].self
            var dateFromFile = ""
            
//            loadJson(url: url) { data in
//                if let data = data {
//                    completion
//                }
//            }
//            //            let json = ReadJson(url: url, published: self.bonuses, as: dataType)
//            print(json)
//            print(self.bonuses)
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    if let d = data {
                        let decodedLists = try JSONDecoder().decode(dataType, from: d)
                        DispatchQueue.main.async {
                            let updatedDate = decodedLists[0].updated
                            
                            do {
                                //print("Get exsisting bonuses")
                                let exsistingFile = self.getApplicationsDirectory().appendingPathComponent(fileName)
                                
                                if (try exsistingFile.checkResourceIsReachable()) {
                                    //print("fileIsReachable")
                                    fileType = LoadAppPathFile(fileName)
                                    dateFromFile = fileType[0].updated
                                }
                                
                            } catch {
                                //print("file not found, needs to be written")
                                dateFromFile = decodedLists[0].updated
                                self.writeInternalJsonData(fileName: fileName, data: d)
                                fileType = LoadAppPathFile(fileName)
                            }
                            
                            if (dateFromFile >= updatedDate) {
                                //print("USE INTERNAL DATA")
                                self.bonuses =  fileType[0].bonusListData
                            } else {
                                //print ("INTERNAL IS OLDER THAN SOURCE - UPDATE")
                                self.writeInternalJsonData(fileName: fileName, data: d)
                                self.bonuses =  decodedLists[0].bonusListData
                            }
                        }
                    } else {
                        print("NO DATA - bonuses")
                    }
                } catch {
                    print("Failed to decode bonuses - JSON :", error)
                }
            }.resume()
        } else {
            print("bonuses already exsists")
            fileType = LoadAppPathFile(fileName)
            self.bonuses =  fileType[0].bonusListData
        }
    }
    
   func loadArmor(domain : String) {
        let fileName = "ArmorItems.json"
        var internalArmor = [ExternalArmorJSON]()
        //print("loadArmor")
        //print(NetworkingManager.obtainedArmor)
        if (NetworkingManager.obtainedArmor == 0) {
            //print("Getting new armor")
            guard let url = URL(string: "\(domain)\(fileName)") else { return }
            let dataType = [ExternalArmorJSON].self
            var dateFromFile = ""
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    if let d = data {
                        let decodedLists = try JSONDecoder().decode(dataType, from: d)
                        DispatchQueue.main.async {
                            let updatedDate = decodedLists[0].updated
                            
                            do {
                                //print("Get exsisting armor")
                                let exsistingFile = self.getApplicationsDirectory().appendingPathComponent(fileName)
                                
                                if (try exsistingFile.checkResourceIsReachable()) {
                                    //print("fileIsReachable")
                                    internalArmor = LoadAppPathFile(fileName)
                                    dateFromFile = internalArmor[0].updated
                                }
                                
                            } catch {
                                //print("file not found, needs to be written")
                                dateFromFile = decodedLists[0].updated
                                self.writeInternalJsonData(fileName: fileName, data: d)
                                internalArmor = LoadAppPathFile(fileName)
                            }
                            
                           if (dateFromFile >= updatedDate) {
                                //print("USE INTERNAL DATA")
                                self.armor =  internalArmor[0].armorListData
                            } else {
                                //print ("INTERNAL IS OLDER THAN SOURCE - UPDATE")
                                self.writeInternalJsonData(fileName: fileName, data: d)
                                self.armor =  decodedLists[0].armorListData
                           }
                        }
                    } else {
                        print("NO DATA - ARMOR")
                    }
                } catch {
                    print("Failed to decode ARMOR - JSON :", error)
                }
            }.resume()
        } else {
            //print("armor already exsists")
            internalArmor = LoadAppPathFile(fileName)
            self.armor =  internalArmor[0].armorListData
        }
    }
    
    
    
    func loadWeights(domain : String) {//ItemWeightInfo.json
        let fileName = "ItemWeightInfo.json"
        var fileType = [ExternalWeightJSON]()
        
        //print("Load Weights")
        //print(NetworkingManager.obtainedArmor)
        if (NetworkingManager.obtainedArmor == 0) {
            guard let url = URL(string: "\(domain)\(fileName)") else { return }
            let dataType = [ExternalWeightJSON].self
            var dateFromFile = ""
            //print("Getting Icons List")
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    if let d = data {
                        let decodedLists = try JSONDecoder().decode(dataType, from: d)
                        DispatchQueue.main.async {
                            let updatedDate = decodedLists[0].updated
                            
                            do {
                                //print("Get exsisting bonuses")
                                let exsistingFile = self.getApplicationsDirectory().appendingPathComponent(fileName)
                                
                                if (try exsistingFile.checkResourceIsReachable()) {
                                    //print("fileIsReachable")
                                    fileType = LoadAppPathFile(fileName)
                                    dateFromFile = fileType[0].updated
                                }
                                
                            } catch {
                                //print("file not found, needs to be written")
                                dateFromFile = decodedLists[0].updated
                                self.writeInternalJsonData(fileName: fileName, data: d)
                                fileType = LoadAppPathFile(fileName)
                            }
                            
                            if (dateFromFile >= updatedDate) {
                                //print("USE INTERNAL DATA")
                                self.weights =  fileType[0].weightListData
                            } else {
                                //print ("INTERNAL IS OLDER THAN SOURCE - UPDATE")
                                self.writeInternalJsonData(fileName: fileName, data: d)
                                self.weights =  decodedLists[0].weightListData
                            }
                        }
                    } else {
                        print("NO DATA - WEIGHTS")
                    }
                } catch {
                    print("Failed to decode WEIGHTS - JSON :", error)
                }
            }.resume()
        } else {
            //print("bonuses already exist")
            fileType = LoadAppPathFile(fileName)
            self.weights =  fileType[0].weightListData
        }
    }
    
    
    
    func loadIcons(domain : String) { //ItemIconListing.json
        let fileName = "ItemIconListing.json"
        var fileType = [ExternalIconJSON]()
        
        
        if (NetworkingManager.obtainedArmor == 0) {
            //print("Getting Icons List")
            guard let url = URL(string: "\(domain)\(fileName)") else { return }
            let dataType = [ExternalIconJSON].self
            var dateFromFile = ""
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    if let d = data {
                        let decodedLists = try JSONDecoder().decode(dataType, from: d)
                        DispatchQueue.main.async {
                            let updatedDate = decodedLists[0].updated
                            
                            do {
                                //print("Get exsisting bonuses")
                                let exsistingFile = self.getApplicationsDirectory().appendingPathComponent(fileName)
                                
                                if (try exsistingFile.checkResourceIsReachable()) {
                                    //print("fileIsReachable")
                                    fileType = LoadAppPathFile(fileName)
                                    dateFromFile = fileType[0].updated
                                }
                                
                            } catch {
                                //print("file not found, needs to be written")
                                dateFromFile = decodedLists[0].updated
                                self.writeInternalJsonData(fileName: fileName, data: d)
                                fileType = LoadAppPathFile(fileName)
                            }
                            
                            if (dateFromFile >= updatedDate) {
                                //print("USE INTERNAL DATA")
                                self.iconList =  fileType[0].iconListData
                            } else {
                                //print ("INTERNAL IS OLDER THAN SOURCE - UPDATE")
                                self.writeInternalJsonData(fileName: fileName, data: d)
                                self.iconList =  decodedLists[0].iconListData
                            }
                        }
                    } else {
                        print("NO DATA - ICONS")
                    }
                } catch {
                    print("Failed to decode ICONS - JSON :", error)
                }
            }.resume()
        } else {
            //print("bonuses already exist")
            fileType = LoadAppPathFile(fileName)
            self.iconList =  fileType[0].iconListData
        }
    }
    
    func getApplicationsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        print(paths)
        return paths[0]
    }
    
    func writeInternalJsonData(fileName: String, data: Data) {
        do {
            let fileUrl = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(fileName)
            
            try data.write(to: fileUrl)
        } catch {
            fatalError("Couldn't write internal version: \(fileName) \n\(error)")
        }
    }
    
   
}



