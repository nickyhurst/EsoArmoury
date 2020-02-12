//
//  FullArmorListView.swift
//  EsoArmoury
//
//  Created by walnut on 2/10/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI

struct FullArmorListView: View {
    //var armor: [ArmorDetailView]
    @EnvironmentObject var userData: UserData
    @ObservedObject var nm = NetworkingManager()
    @State private var searchTerm: String = ""
    
    
    let filtered = armorDataExternal.filterDuplicates{ $0.id == $1.id && $0.name == $1.name}
    //@State private var searchTerm: String = ""
    //var armorList : [ArmorListData]
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                VStack() {
                    TopImageDisplayView(weight: 100)
                    
                    Section {
                        SearchBar(text: self.$searchTerm).onTapGesture {
                            UIApplication.shared.endEditing()
                        }
                    }
                    
                    ToggleItemView()
                    
                    List(nm.armor
                        .filter { self.searchTerm.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchTerm) }
                        .sorted(by: { $0.name < $1.name } ), id: \.id
                    ) { armor in
                        
                        if ( (!self.userData.showAcquiredOnly || DesirableOptions.shared.isDesirable(armorId: armor.id, type: "favorite", data: self.userData) ) && ( !self.userData.showWantedOnly || DesirableOptions.shared.isDesirable(armorId: armor.id, type: "wanted", data: self.userData) )) {
                        
                            VStack {
                                NavigationLink(destination: ArmorDetailView(armor: armor)
                                    .environmentObject(self.userData)
                                ) {
                                    ArmorLinkDetailView(armor: armor, passedWeight: armor.armorTypes[0].id)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text(weightName(id: 100)), displayMode: .inline)
        }
        
    }
}


struct TopImageDisplayView: View {
    var weight: Int
    var body: some View {
        HStack(alignment: .top) {
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
                //                Spacer()
            }
            //}
            
        }
    }
}

struct FullArmorListView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return FullArmorListView()
            .environmentObject(userData)
        
    }
}

struct SearchBarView: View {
    @State private var searchTerm: String = ""
    var body: some View {
        VStack {
            SearchBar(text: self.$searchTerm).onTapGesture {
                UIApplication.shared.endEditing()
            }
            //            Spacer()
        }
    }
}

struct ToggleItemView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Section {
            Toggle(isOn: $userData.showAcquiredOnly) {
                Text("Acquired Items only")
            }
            Toggle(isOn: $userData.showWantedOnly) {
                Text("Wanted Items only")
            }
        }
    }
}
