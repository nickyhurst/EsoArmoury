//
//  WeightList.swift
//  EsoArmoury
//
//  Created by walnut on 8/27/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct WeightList: View {
    @EnvironmentObject var userData: UserData
    var weightType: ArmorTypes
    var armor: Armor
    var passedWeight: Int
    
    //var weights: [ArmorTypes]
    var body: some View {
        VStack {
            ForEach(weightData) { weights in
                if (self.weightType.id == weights.id && weights.id ==  self.passedWeight) {
                    
                    HStack(alignment: .top) {
                        self.armor.image
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    //.shadow(radius: 1)
                                VStack(alignment:.leading, spacing: 6) {
                                    Text(self.armor.name)
                                        //.foregroundColor(.yellow)
                                        .font(Font.custom("PlaneWalker", size: 15))
                                        .font(.headline)
                                    if (self.armor.type != "") {
                                        if (self.armor.type == "Craftable") {
                                            Text("(\(self.armor.type) : \(self.armor.traits) Traits)")
                                            .foregroundColor(.secondary)
                                            .font(.subheadline)
                                        }
                                        else {
                                            Text("("+self.armor.type+")")
                                                .foregroundColor(.secondary)
                                                .font(.subheadline)
                                        }
                                    }
                                    if (self.armor.dlc != "") {
                                        Text("("+self.armor.dlc+")")
                                            .foregroundColor(.secondary)
                                            .font(.footnote)
                                    }
                        }
                            
                                Spacer()
                        HStack {
                            VStack {
                                if (self.armor.isFavorite) {
                                    Image(systemName: "checkmark.shield.fill")
                                        .imageScale(.medium)
                                        .foregroundColor(.yellow)
                                }
                                if (self.armor.isWanted) {
                                    Image(systemName: "paperclip.circle.fill")
                                        .imageScale(.medium)
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
//                        Spacer()
//                        if (self.armor.isFavorite) {
//                            Text("F True")
//                        }
//                        else {
//                            Text("F False")
//                        }
//                        if (self.armor.isWanted) {
//                            Text("W True")
//                        }
//                        else {
//                            Text("W False")
//                        }
                    }
                    
                    
                    
                    //ArmorRow(armor: self.armor)
                } // Verbose check to ensure display correct armor
            } // ForEach to cycle weight data
        } // VStack
    } // View
} // Struct

#if DEBUG
struct WeightList_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return WeightList(weightType: armorData[0].armorTypes[0], armor: armorData[1], passedWeight: 1001)
         .environmentObject(userData)
    }
}
#endif
