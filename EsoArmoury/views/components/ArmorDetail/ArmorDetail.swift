//
//  ArmorDetail.swift
//  EsoArmoury
//
//  Created by walnut on 8/20/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

//extension VerticalAlignment {
//    enum Custom: AlignmentID {
//        static func defaultValue(in d: ViewDimensions) -> CGFloat { d[.top] }
//    }
//
//    static let custom = VerticalAlignment(Custom.self)
//}

struct ArmorDetail: View {
    @EnvironmentObject var userData: UserData
    //var armor: Armor
    var armor: Armor
    var armorIndex: Int {
        userData.armors.firstIndex(where: { $0.id == armor.id })!
    }
    //var sets: [BonusSets]
    
    
    
    var body: some View {
        List {
            
            TitleView(userData: _userData, armor: armor)
            
            LocationView(armor: armor)
                .font(.subheadline)
                
            
            Section(header: Text("Set Bonus")) {
                SetBonusRow(bonus: self.armor.bonus)
                .font(.subheadline)
            }
            Section(header: Text("Available As")) {
                ForEach(armor.armorTypes) { type in
                    IconDisplay(armorInfo: self.armor, weight: type.id)
                    .font(.subheadline)
                }
            }
        }
    }
}

#if DEBUG
struct ArmorDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ArmorDetail(armor: userData.armors[24])
            .environmentObject(userData)
    }
}
#endif

struct TitleView: View {
    @EnvironmentObject var userData: UserData
    var armor: Armor
    var armorIndex: Int {
        userData.armors.firstIndex(where: { $0.id == armor.id })!
    }
    
    private func getColorForBool(bool: Bool) -> Color {
        if (bool) {
            return .yellow
        }
        return .gray
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text(verbatim: armor.name)
                .font(Font.custom("PlaneWalker", size: 35))
                .foregroundColor(Color("itemGold"))
                .padding(.top, 5)
                .padding(.bottom, 5)
            Spacer()
            VStack {
                Image(systemName: "checkmark.shield.fill")
                    .imageScale(.large)
                    .foregroundColor(getColorForBool(bool: self.userData.armors[self.armorIndex].isFavorite))
                    .onTapGesture {
                        self.userData.armors[self.armorIndex].isFavorite.toggle()
                }
                .padding(.bottom, 10)
                Image(systemName: "paperclip.circle")
                    .imageScale(.large)
                    .foregroundColor(getColorForBool(bool: self.userData.armors[self.armorIndex].isWanted))
                    .onTapGesture {
                        self.userData.armors[self.armorIndex].isWanted.toggle()
                }
                
            }
            
        }
    }
}

struct LocationView: View {
    var armor: Armor
    var body: some View {
        Section {
            VStack(alignment: .leading){
                Text("Level " + armor.min + " - " + armor.max)
                    //.font(.footnote)
                
                Text("Type: " + armor.type )
                //.font(.footnote)
                
                Text("Location: " + armor.location)
                    //.font(.footnote)
                    .lineLimit(nil)
                if (armor.type == "Craftable") {
                    Text("Traits needed to craft: " + armor.traits)
                    //.font(.footnote)
                }
                else {
                    Text("Style: " + armor.style)
                    //.font(.footnote)
                }
                if (armor.dlc != "") {
                    Text("Requires: " + armor.dlc)
                    //.font(.footnote)
                }
            }
        }
    }
}
