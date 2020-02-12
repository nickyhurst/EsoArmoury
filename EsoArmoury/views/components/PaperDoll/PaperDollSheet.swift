//
//  PaperDollSheet.swift
//  EsoArmoury
//
//  Created by walnut on 1/10/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI

struct PaperDollSheet: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                HStack{
                    
                    if (self.userData.activeHead.count == 1) {
                        DisplayItemIcon(armor: self.userData.activeHead[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeHead[0].weightId, itemId: self.userData.activeHead[0].iconId), size: 40)
                    }
                    
                }
                HStack(alignment: .top) {
                    VStack {
                        if (self.userData.activeShoulder.count == 1) {
                            DisplayItemIcon(armor: self.userData.activeShoulder[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeShoulder[0].weightId, itemId: self.userData.activeShoulder[0].iconId), size: 40)
                        }
                        if (self.userData.activeWaist.count == 1) {
                            DisplayItemIcon(armor: self.userData.activeWaist[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeWaist[0].weightId, itemId: self.userData.activeWaist[0].iconId), size: 40)
                        }
                        //DisplayItemIcon(armor: armorData[370], iconType: "_shoulders_", size: 40)
                        //DisplayItemIcon(armor: armorData[66], iconType: "_medium_waist_", size: 40)
                    }
                    VStack {
                        if (self.userData.activeChest.count == 1) {
                            DisplayItemIcon(armor: self.userData.activeChest[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeChest[0].weightId, itemId: self.userData.activeChest[0].iconId), size: 40)
                        }
                        if (self.userData.activeLegs.count == 1) {
                            DisplayItemIcon(armor: self.userData.activeLegs[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeLegs[0].weightId, itemId: self.userData.activeLegs[0].iconId), size: 40)
                        }
                        //DisplayItemIcon(armor: armorData[66], iconType: "_medium_chest_", size: 40)
                        //DisplayItemIcon(armor: armorData[66], iconType: "_medium_legs_", size: 40)
                    }
                    VStack {
                        if (self.userData.activeHand.count == 1) {
                            DisplayItemIcon(armor: self.userData.activeHand[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeHand[0].weightId, itemId: self.userData.activeHand[0].iconId), size: 40)
                        }
                        if (self.userData.activeShoes.count == 1) {
                            DisplayItemIcon(armor: self.userData.activeShoes[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeShoes[0].weightId, itemId: self.userData.activeShoes[0].iconId), size: 40)
                        }
//                        DisplayItemIcon(armor: armorData[66], iconType: "_medium_hand_", size: 40)
//                        DisplayItemIcon(armor: armorData[66], iconType: "_medium_feet_", size: 40)
                    }
                }
                //Spacer()
            }
            Spacer()
            HStack {
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            if (self.userData.activeNeck.count == 1) {
                                DisplayItemIcon(armor: self.userData.activeNeck[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeNeck[0].weightId, itemId: self.userData.activeNeck[0].iconId), size: 40)
                            }
                            if (self.userData.activeRing1.count == 1) {
                                DisplayItemIcon(armor: self.userData.activeRing1[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeRing1[0].weightId, itemId: self.userData.activeRing1[0].iconId), size: 40)
                            }
                            if (self.userData.activeRing2.count == 1) {
                                DisplayItemIcon(armor: self.userData.activeRing2[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeRing2[0].weightId, itemId: self.userData.activeRing2[0].iconId), size: 40)
                            }
//                            DisplayItemIcon(armor: armorData[66], iconType: "_neck_", size: 40)
//
//                            DisplayItemIcon(armor: armorData[66], iconType: "_ring_", size: 40)
//
//                            DisplayItemIcon(armor: armorData[66], iconType: "_ring_", size: 40)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            if (self.userData.activeWeap1.count == 1) {
                                DisplayItemIcon(armor: self.userData.activeWeap1[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeWeap1[0].weightId, itemId: self.userData.activeWeap1[0].iconId), size: 40)
                            }
                            if (self.userData.activeWeap2.count == 1) {
                                DisplayItemIcon(armor: self.userData.activeWeap2[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeWeap2[0].weightId, itemId: self.userData.activeWeap2[0].iconId), size: 40)
                            }
//                            DisplayItemIcon(armor: armorData[66], iconType: "_1haxe_", size: 40)
//
//                            DisplayItemIcon(armor: armorData[66], iconType: "_shield_", size: 40)
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            if (self.userData.activeBackWeap1.count == 1) {
                                DisplayItemIcon(armor: self.userData.activeBackWeap1[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeBackWeap1[0].weightId, itemId: self.userData.activeBackWeap1[0].iconId), size: 40)
                            }
                            if (self.userData.activeBackWeap2.count == 1) {
                                DisplayItemIcon(armor: self.userData.activeBackWeap2[0].armor, iconType: GetIconWeightName(weightId: self.userData.activeBackWeap2[0].weightId, itemId: self.userData.activeBackWeap2[0].iconId), size: 40)
                            }
//                            DisplayItemIcon(armor: armorData[66], iconType: "_1haxe_", size: 40)
//                            
//                            DisplayItemIcon(armor: armorData[66], iconType: "_shield_", size: 40)
                        }
                    }
                }
            }
            
        }
        .padding(.horizontal)
    }
}

struct PaperDollSheet_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PaperDollSheet()
            .environmentObject(userData)
    }
}
