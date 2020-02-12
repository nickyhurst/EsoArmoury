//
//  ArmorListNoScroll.swift
//  EsoArmoury
//
//  Created by walnut on 9/6/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct ArmorListNoScroll: View {
    @State private var searchTerm: String = ""
    
    var weight: Int
    //var page: Int
    
    var body: some View {
        ArmorListView(weight: weight)
        
        
//        List {
//            Section {
//                ZStack {
//
//                    GetWeightData(id: weight)!.image
//                    .resizable()
//                        .renderingMode(.original)
//                        .aspectRatio(nil, contentMode: .fill)
//                        .frame(width:UIScreen.main.bounds.width * 0.9, height: 100, alignment: .top).clipped()
//                    //ZStack (alignment: .bottomLeading){
//
//
//
//                        Rectangle()
//                            .frame(width:UIScreen.main.bounds.width * 0.9, height: 50)
//                        .foregroundColor(.black)
//                            .opacity(0.3)
//                    VStack(alignment: .center) {
//                        Text(GetWeightData(id: weight)!.weight)
//                            .foregroundColor(.white)
//                            //.font(Font.custom("PlaneWalker", size: 32))
//                            .font(.title)
//                            .padding(.leading)
//                            .padding(.bottom, 5)
//                            .padding(.trailing)
//
//                    }
//                }
//
////                Text(weightName(id: weight) + " Sets")
////                    .font(Font.custom("PlaneWalker", size: 20))
//            }
//            Section {
//                SearchBar(text: self.$searchTerm)
//            }
//            Section {
//                ForEach(armorData
//                    .filter { self.searchTerm.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchTerm)}
//                    .sorted(by:
//                        {
//                            weight == 2002 ?
//                            $0.traits < $1.traits :
//                            $0.name < $1.name
//                        }
//                    )
//                ) { armor in
//                    ForEach(armor.armorTypes) { avail in
//                        if (self.weight == avail.id) {
//                            NavigationLink(destination: ArmorDetail(armor: armor)) {
//                                WeightList(weightType: avail, armor: armor, passedWeight: self.weight)
//                            } // NavigationLink
//                        } // Ensure currently selected weight option
//                    } // Foreach ArmorTypes
//                } // Foreach Armor - Filter and Sorting
//            } // Section
//        } // List
        //} // NavigationView
    } // View
} // Struct

struct ArmorListNoScroll_Previews: PreviewProvider {
    static var previews: some View {
        ArmorListNoScroll(weight: 2001)
    }
}
