//
//  ArmorList.swift
//  EsoArmoury
//
//  Created by walnut on 9/17/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct ArmorListView: View {
    @EnvironmentObject var userData: UserData
    @State private var searchTerm: String = ""
    
//    private let searchTapp = PassthroughSubject<Void, Error>()
//    private var disposebag = Set<AnyCancellable>()
//    
//    init() {
//        searchTapp
//            .flatMap {
//                self.
//        }
//    }
    
    var weight: Int
    var body: some View {
        List {
            ContentImageView(weight: weight)
            Section {
                SearchBar(text: self.$searchTerm)
                    //.keyboardType(.alphabet)
                
//                    .onTapGesture {
//                        UIApplication.shared.endEditing()
//                    }
            }
            Section {
                Toggle(isOn: $userData.showAcquiredOnly) {
                    Text("Acquired Items only")
                        .font(.subheadline)
                }
                Toggle(isOn: $userData.showWantedOnly) {
                    Text("Wanted Items only")
                    .font(.subheadline)
                }
                    //if !self.showFavoritesOnly || armor.isFavorite {
                    ForEach(userData.armors
                        .filter { self.searchTerm.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchTerm)}
                        .sorted(by:
                            {
                                $0.name < $1.name
                            // If Crafted display via Required Craft Traits
                            //weight == 2002 ? $0.traits < $1.traits : $0.name < $1.name
                            }
                        )
                    ) { armor in
                        ForEach(armor.armorTypes) { avail in
                            //if (self.userData.showAcquiredOnly ? armor.isFavorite : self.userData.showWantedOnly ? armor.isWanted : avail) {
                            
                            if ((!self.userData.showAcquiredOnly || armor.isFavorite) && (!self.userData.showWantedOnly || armor.isWanted)) {
                                if (self.weight == avail.id) {
                                    NavigationLink(destination: ArmorDetail(armor: armor)
                                        .environmentObject(self.userData)
                                    ) {
                                        WeightList(weightType: avail, armor: armor, passedWeight: self.weight)
                                    } // NavigationLink
                                } // Ensure currently selected weight option
                            } //if
                        } // Foreach ArmorTypes
                    } // Foreach Armor - Filter and Sorting
            } // Section
        } // List
    }
}

struct ArmorListView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ArmorListView(weight: 1003)
            .environmentObject(userData)
    }
}

struct ContentImageView: View {
    var weight: Int
    var body: some View {
        Section {
            ZStack {
                
                GetWeightData(id: weight)!.image
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(nil, contentMode: .fill)
                    .frame(width:UIScreen.main.bounds.width * 0.9, height: 100, alignment: .top).clipped()
                Rectangle()
                    .frame(width:UIScreen.main.bounds.width * 0.9, height: 50)
                    .foregroundColor(.black)
                    .opacity(0.3)
                VStack(alignment: .center) {
                    Text(GetWeightData(id: weight)!.weight)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.leading)
                        .padding(.bottom, 5)
                        .padding(.trailing)
                    
                }
            }
        }
    }
}
