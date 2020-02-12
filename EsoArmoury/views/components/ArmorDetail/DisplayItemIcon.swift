//
//  DisplayItemIcon.swift
//  EsoArmoury
//
//  Created by walnut on 10/24/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct DisplayItemIcon: View {
    @EnvironmentObject var userData: UserData
    var armor: Armor
    var iconType: String
    var size: CGFloat
    
    private func GatherImage2(armor: Armor, iconType: String) -> Image {
        var name = "armorIcons/" + armor.prefix + iconType + armor.suffix
        
        if (iconType == "_ring_" || iconType == "_neck_") {
            var pref = "breton"
            var suff = "a"
            name = "armorIcons/" + pref + iconType + suff
        }
        //print(name)
        var image: Image {
            ImageStore.shared.image(name: name)
        }
        return image
    }
    
    var body: some View {
        
        self.GatherImage2(armor: armor, iconType: iconType)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(Color("itemGold"), lineWidth: 2))
            .padding(3)
        
    }
}

struct DisplayItemIcon_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return DisplayItemIcon(armor: userData.armors[24], iconType: "head", size: 60)
            .environmentObject(userData)
    }
}
