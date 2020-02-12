//
//  EntireArmorListView.swift
//  EsoArmoury
//
//  Created by walnut on 10/16/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct EntireArmorListView: View {
    @ObservedObject var networkingManager = NetworkingManager()
    @EnvironmentObject var userData: UserData
    @State private var searchTerm: String = ""
    //private var prev: Int
    let filtered = armorData.filterDuplicates{ $0.id == $1.id && $0.name == $1.name}
    init() {
        print("armorData")
        print(armorData.count)
        print("networkingManager")
//        print(userData.data.armor.count)
    //        WebService().getEsoData {
    //            print($0)
    //        }
        }
    
    private func changePrevValue(curr: Int) -> Int {
        //self.prev = curr
        return curr
    }
    
    var body: some View {
        NavigationView {
            List {
                ContentImageView(weight: 100)
                
                Section {
                    SearchBar(text: self.$searchTerm).onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                }
                Section {
                    Toggle(isOn: $userData.showAcquiredOnly) {
                        Text("Acquired Items only")
                    }
                    Toggle(isOn: $userData.showWantedOnly) {
                        Text("Wanted Items only")
                    }
                    ForEach(userData.armors
                        .filter { self.searchTerm.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchTerm)}
                        .sorted(by: { $0.name < $1.name } )
                    ) { armor in
                        if ((!self.userData.showAcquiredOnly || armor.isFavorite) && (!self.userData.showWantedOnly || armor.isWanted)) {
                            VStack {
                                NavigationLink(destination: ArmorDetail(armor: armor)
                                    .environmentObject(self.userData)
                                ) {
                                        WeightList(weightType: armor.armorTypes[0], armor: armor, passedWeight: armor.armorTypes[0].id)
                                    } // NavigationLink
                            }
                        }
                   } // Foreach Armor - Filter and Sorting
                } // Section
            } // List
        .navigationBarTitle(Text(weightName(id: 100)), displayMode: .inline)
        }
        
    }
   
}

extension Array {
    func filterDuplicates(_ includeElement: (_ lhs: Element, _ rhs: Element) -> Bool) -> [Element] {
        var results = [Element]()
        
        forEach{ (element) in
            let exisitingElements = results.filter {
                return includeElement(element, $0)
            }
            if exisitingElements.count == 0 {
                results.append(element)
            }
        }
        return results
    }
}

struct EntireArmorListView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return EntireArmorListView()
            .environmentObject(userData)
        
    }
}
