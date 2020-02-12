//
//  ArmorRow.swift
//  EsoArmoury
//
//  Created by walnut on 8/20/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct ArmorRow: View {
    var armor: Armor
    //var armorType:String
    
    var body: some View {
        HStack(alignment: .top) {
            armor.image
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                //.shadow(radius: 1)
            VStack(alignment:.leading, spacing: 6) {
                Text(armor.name)
                    //.foregroundColor(.yellow)
                    .font(Font.custom("PlaneWalker", size: 15))
                    .font(.headline)
                if (armor.type != "") {
                    if (armor.type == "Craftable") {
                        Text("(\(armor.type) : \(armor.traits) Traits)")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                    }
                    else {
                        Text("("+armor.type+")")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
                }
                if (armor.dlc != "") {
                    Text("("+armor.dlc+")")
                        .foregroundColor(.secondary)
                        .font(.footnote)
                }
//                if (armors.isFavorite) {
//                    Image(systemName: "star.fill")
//                        .imageScale(.medium)
//
//                }
            }
        
            Spacer()
            if (armor.isFavorite) {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
            Text("ArmorRow")
                .font(.subheadline)
        }
        
    }
}

#if DEBUG
struct ArmorRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //ArmorRow()
            ArmorRow(armor: armorData[0])
            ArmorRow(armor: armorData[18])
        }
        .previewLayout(.fixed(width: 300, height: 80))
    }
}
#endif
