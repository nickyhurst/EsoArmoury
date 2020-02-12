//
//  IconDisplay.swift
//  EsoArmoury
//
//  Created by walnut on 9/3/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct IconDisplay: View {
    @State var showModal = false
    @EnvironmentObject var userData: UserData
    var armorInfo: Armor
    var weight: ItemType.ID
    //@State var showDetails = false
    
    //    var armorIndex: Int {
    //        userData.armors.firstIndex(where: { $0.id == armor.id })!
    //    }
    
    private func GetSubTextName(id: Int) -> Text {
        for (_, array) in weightData.enumerated()
        {
            if (array.id == id) {
                return Text(array.subText)
            }
        }
        return Text("Weight not found")
    }
    
    private func GatherImage(pre: String, suf: String, imageName: String) -> Image {
        
        var name = "armorIcons/" + pre + imageName + suf
        
        if (imageName == "_ring_" || imageName == "_neck_") {
            var pref = "breton"
            var suff = "a"
            name = "armorIcons/" + pref + imageName + suff
        }
        //print(name)
        var image: Image {
            ImageStore.shared.image(name: name)
        }
        return image
    }
    
    
    var body: some View {
        VStack {
            ForEach(iconData) { icon in
                if (self.weight == icon.id) {
                    VStack(alignment: .leading) {
                        self.GetSubTextName(id: icon.id)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(icon.icons) { style in
                                    
                                    VStack {
                                        DisplayItemIcon(armor: self.armorInfo, iconType:
                                            GetIconWeightName(weightId: self.weight, itemId: style.id), size: 50)
                                        
                                        Text(String(self.armorInfo.id))
                                    }
                                    .onTapGesture {
                                        self.showModal.toggle()
                                        let aa = ActiveArmor(armor: self.armorInfo, weightId: self.weight, iconId: style.id)
                                        
                                        if (style.id == 100){
                                            if (self.userData.activeRing1.count == 1) && (self.userData.activeRing2.count == 1) {
                                                self.userData.activeRing1.remove(at: 0)
                                                self.userData.activeRing1.insert(aa, at: 0)
                                            }
                                            else if (self.userData.activeRing1.count == 1) {
                                                self.userData.activeRing2.insert(aa, at: 0)
                                            }
                                            else {
                                                self.userData.activeRing1.insert(aa, at: 0)
                                            }
                                        }
                                        
                                        if (style.id == 101){
                                            if (self.userData.activeNeck.count == 1) {
                                                self.userData.activeNeck.remove(at: 0)
                                            }
                                            self.userData.activeNeck.insert(aa, at: 0)
                                        }
                                        
                                        if (style.id == 200) || (style.id == 201) || (style.id == 202) || (style.id == 203) || (style.id == 204)  || (style.id == 205)  || (style.id == 206)  || (style.id == 207)  || (style.id == 209){
                                            if (self.userData.activeWeap1.count == 1) {
                                                if (self.userData.activeWeap1[0].iconId == 203) || (self.userData.activeWeap1[0].iconId == 204) || (self.userData.activeWeap1[0].iconId == 205) || (self.userData.activeWeap1[0].iconId == 206) || (self.userData.activeWeap1[0].iconId == 209) {
                                                    if (self.userData.activeWeap2.count == 1) {
                                                        self.userData.activeWeap2.remove(at: 0)
                                                    }
                                                    self.userData.activeWeap1.remove(at: 0)
                                                    self.userData.activeWeap1.insert(aa, at: 0)
                                                }
                                                else if (style.id == 200) || (style.id == 201) || (style.id == 202) || (style.id == 207) {
                                                     if (self.userData.activeWeap2.count == 1) {
                                                         self.userData.activeWeap2.remove(at: 0)
                                                     }
                                                    self.userData.activeWeap2.insert(aa, at: 0)
                                                }
                                                else {
                                                    if (self.userData.activeWeap2.count == 1) {
                                                        self.userData.activeWeap2.remove(at: 0)
                                                    }
                                                    self.userData.activeWeap1.remove(at: 0)
                                                    self.userData.activeWeap1.insert(aa, at: 0)
                                                }
                                            }
                                            else {
                                                self.userData.activeWeap1.insert(aa, at: 0)
                                            }
                                        }
                                        
                                        if (style.id == 208) {
                                            if (self.userData.activeWeap1.count == 1) {
                                                if (self.userData.activeWeap1[0].iconId == 203) || (self.userData.activeWeap1[0].iconId == 204) || (self.userData.activeWeap1[0].iconId == 205) || (self.userData.activeWeap1[0].iconId == 206) || (self.userData.activeWeap1[0].iconId == 209) {
                                                    self.userData.activeWeap1.remove(at: 0)
                                                    //self.userData.activeWeap1.insert(aa, at: 0)
                                                }
                                            }
                                            if (self.userData.activeWeap2.count == 1) {
                                                self.userData.activeWeap2.remove(at: 0)
                                            }
                                            self.userData.activeWeap2.insert(aa, at: 0)
                                        }
                                        
                                        if (style.id == 300) || (style.id == 400) || (style.id == 500) || (style.id == 600) {
                                            if (self.userData.activeHead.count == 1) {
                                                self.userData.activeHead.remove(at: 0)
                                            }
                                            self.userData.activeHead.insert(aa, at: 0)
                                        }
                                        if (style.id == 301) || (style.id == 401) || (style.id == 501) || (style.id == 601) {
                                            if (self.userData.activeShoulder.count == 1) {
                                                self.userData.activeShoulder.remove(at: 0)
                                            }
                                            self.userData.activeShoulder.insert(aa, at: 0)
                                        }
                                        if (style.id == 302) || (style.id == 303) || (style.id == 402) || (style.id == 502) {
                                            if (self.userData.activeChest.count == 1) {
                                                self.userData.activeChest.remove(at: 0)
                                            }
                                            self.userData.activeChest.insert(aa, at: 0)
                                        }
                                        if (style.id == 304) || (style.id == 403) || (style.id == 503) {
                                            if (self.userData.activeHand.count == 1) {
                                                self.userData.activeHand.remove(at: 0)
                                            }
                                            self.userData.activeHand.insert(aa, at: 0)
                                        }
                                        if (style.id == 305) || (style.id == 404) || (style.id == 504) {
                                            if (self.userData.activeWaist.count == 1) {
                                                self.userData.activeWaist.remove(at: 0)
                                            }
                                            self.userData.activeWaist.insert(aa, at: 0)
                                        }
                                        if (style.id == 306) || (style.id == 405) || (style.id == 505) {
                                            if (self.userData.activeLegs.count == 1) {
                                                self.userData.activeLegs.remove(at: 0)
                                            }
                                            self.userData.activeLegs.insert(aa, at: 0)
                                                                               }
                                        if (style.id == 307) || (style.id == 406) || (style.id == 506) {
                                            if (self.userData.activeShoes.count == 1) {
                                                self.userData.activeShoes.remove(at: 0)
                                            }
                                            self.userData.activeShoes.insert(aa, at: 0)
                                                                           }
                                    }
                                    .sheet(isPresented: self.$showModal) {
                                        ArmorType()
                                        .environmentObject(self.userData)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct IconDisplay_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return IconDisplay(armorInfo: armorData[10], weight: weightData[8].id)
            .environmentObject(userData)
    }
}
#endif

//struct previousIconLink: View {
//var body: some View {
//NavigationLink(destination: ArmorType()
//.environmentObject(
//self.userData
//,
//                                            self.userData.activeHead[0].armorId = self.armorInfo,
//                                            self.userData.activeHead[0].weightId = self.weight,
//                                            self.userData.activeHead[0].iconId = style.id
//)) {
//DisplayItemIcon(armor: self.armorInfo, iconType: GetIconWeightName(weightId: self.weight, itemId: style.id))
//self.userData.activeHead = self.armorInfo.id
//DisplayItemIcon(armor: self.$userData.armors, iconType: style.image_name)

//DisplayItemIcon(pre: self.armorInfo.prefix, suf: self.armorInfo.suffix, image: style.image_name)
//                                            .onTapGesture {
//                                                self.userData.activeHead = self.armorInfo.id
//                                            }

//}.buttonStyle(PlainButtonStyle()
//                                        .onTapGesture {
//                                            self.userData.activeHead[0].armorId = self.armorInfo
//                                            self.userData.activeHead[0].weightId = self.weight
//                                            self.userData.activeHead[0].iconId = style.id
//                                        }
//)
//}
//}
