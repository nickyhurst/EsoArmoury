//
//  ArmorLinkDetailView.swift
//  EsoArmoury
//
//  Created by walnut on 2/10/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI

struct ArmorLinkDetailView: View {
    @EnvironmentObject var userData: UserData
    //@ObservedObject var nm = NetworkingManager()
    
    var armor: ArmorListData
    //var passedWeight: Int
    
    var body: some View {
        VStack {
            //ForEach(nm.weights) { weights in
                //if (weights.id == self.passedWeight) {
                    HStack(alignment: .top) {
                        self.armor.image
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(self.armor.name)
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
                                if (DesirableOptions.shared.isDesirable(armorId: self.armor.id, type: "favorite", data: self.userData)) {
                                    Image(systemName: "checkmark.shield.fill")
                                        .imageScale(.medium)
                                        .foregroundColor(.yellow)
                                }
                                if (DesirableOptions.shared.isDesirable(armorId: self.armor.id, type: "wanted", data: self.userData)) {
                                    Image(systemName: "paperclip.circle.fill")
                                        .imageScale(.medium)
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                    }
                //}
            //}
            .frame(height: 70)
        }// VStack
    }
}

struct ArmorLinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorLinkDetailView(armor: NetworkingManager().armor[0])
    }
}
