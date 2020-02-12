//
//  ContentView.swift
//  EsoArmoury
//
//  Created by walnut on 8/20/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    //var items: [ItemType]
    
    private func armorTypes(weight: [ItemType]) -> some View {
        Section {
            List(weight) { armorType in
                //NavigationLink(destination: ArmorList() { //(displayedArmorId: armorType.id)) {
                    WeightDetail(weight: armorType)
                    .frame(height:150)
                    .padding(.trailing, 30)
                //})
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Section {
                armorTypes(weight: weightData)
            }
        .navigationBarTitle("ESO Armory")
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
