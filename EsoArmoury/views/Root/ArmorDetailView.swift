//
//  ArmorDetailView.swift
//  EsoArmoury
//
//  Created by walnut on 2/10/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct ArmorDetailView: View {
    @EnvironmentObject var userData: UserData
    //@ObservedObject var nm = NetworkingManager()
    var armor: ArmorListData
    var externalWeightData: [WeightType]
    var externalIconData: [IconsList]
    
    
    var body: some View {
        List {
            
            ArmorTitleView(userData: _userData, armor: armor)
            
            ArmorLocationView(armor: armor)
            
            Section(header: Text("Set Bonus")) {
                ArmorBonusRowView(bonus: self.armor.bonus)
                    .font(.subheadline)
            }
            
            Section(header: Text("Available as:")) {
                ForEach(armor.armorTypes) { type in
                    
                    DisplayIconRow(armor: self.armor, selectedWeight: type.id, externalIconData: self.externalIconData, externalWeightData: self.externalWeightData)
                    
                }
            }
        }
    }
}

//struct ArmorDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArmorDetailView(armor: NetworkingManager().armor[0])
//    }
//}


struct ArmorTitleView: View {
    @EnvironmentObject var userData: UserData
    //@ObservedObject var nm = NetworkingManager()
    var armor: ArmorListData
    
    private func getColorForBool(bool: Bool) -> Color {
        if (bool) {
            return .yellow
        }
        return .gray
    }
    
    var body: some View {
        HStack(alignment: .top) {
            
            Text(armor.name)
                .font(Font.custom("PlaneWalker", size: 35))
                .foregroundColor(Color("itemGold"))
                .padding(.top, 5)
                .padding(.bottom, 5)
            Spacer()
            VStack {
                Image(systemName: "checkmark.shield.fill")
                    .imageScale(.large)
                    .foregroundColor(getColorForBool( bool: DesirableOptions.shared.isDesirable(armorId: armor.id, type: "favorite", data: userData) ) )
                    .onTapGesture { DesirableOptions.shared.setStatus(armorId: self.armor.id, type: "favorite", data: self.userData) }
                    .padding(.bottom, 10)
                
                Image(systemName: "paperclip.circle")
                    .imageScale(.large)
                    .foregroundColor(getColorForBool(bool: DesirableOptions.shared.isDesirable(armorId: armor.id, type: "wanted", data: userData)))
                    .onTapGesture { DesirableOptions.shared.setStatus(armorId: self.armor.id, type: "wanted", data: self.userData) }
            }
        }
    }
}

struct ArmorLocationView: View {
    var armor: ArmorListData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Level " + armor.min + " - " + armor.max)
            
            Text("Type: " + armor.type )
            
            Text("Location: " + armor.location)
                .lineLimit(nil)
            if (armor.type == "Craftable") {
                Text("Traits needed to craft: " + armor.traits)
            }
            else {
                Text("Style: " + armor.style)
            }
            if (armor.dlc != "") {
                Text("Requires: " + armor.dlc)
            }
        }
        
    }
}

struct ArmorBonusRowView: View {
    var bonus: [Bonus]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(self.bonus, id: \.items) { set in
                HStack(alignment: .top) {
                    Text(set.items)
                    Highlight(text: GetBonusData(id: set.bonusId)!.desc)
                }
            }
        }
    }
    
}


//struct ArmorAvailableIconDisplayView: View {
//    @EnvironmentObject var userData: UserData
//    @State var showModal = false
//    var armor: ArmorListData
//    var selectedWeight: Int
//    var externalWeightData: [WeightType]
//    var externalIconData: [IconsList]
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            DisplayIconRow(armor: self.armor, selectedWeight: self.selectedWeight, externalIconData: self.externalIconData, externalWeightData: self.externalWeightData)
//        }
//    }
//}

struct DisplayIconRow: View {
    var armor: ArmorListData
    var selectedWeight: Int
    var externalIconData: [IconsList]
    var externalWeightData: [WeightType]
    
    func GetSectionNameFromId(id: Int, weights: [WeightType]) -> String {
//        for weight in weights {
//            print(weight.id)
//        }
//        return "nothing here right now"
        return weights.filter( { $0.id == id } ).first!.subText
    }
    
    var body: some View {
        VStack {
            
            ForEach(externalIconData) { icon in
                if (self.selectedWeight == icon.id) {
                    VStack(alignment: .leading) {
                        Text(self.GetSectionNameFromId(id: self.selectedWeight, weights: self.externalWeightData))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(icon.icons) { style in
                                    VStack {
                                        DisplayArmorIcon(armor: self.armor, iconId: style.id, weightId: self.selectedWeight, size: 50, externalWeightData: self.externalWeightData, externalIconData: self.externalIconData)
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

struct IconRow: View {
    
    var armor: ArmorListData
    var icons: IconsList
    var externalWeightData: [WeightType]
    var externalIconData: [IconsList]
    
    var body: some View {
        VStack {
            
            ForEach(icons.icons) { style in
                Text(style.image_name)
                if (style.image_name != "error") {
                    ForEach(self.armor.armorTypes) { armorType in
                        
                        VStack(alignment: .leading) {
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                DisplayArmorIcon(armor: self.armor, iconId: style.id, weightId: self.icons.id, size: 50, externalWeightData: self.externalWeightData, externalIconData: self.externalIconData)
                                    .frame(height: 60)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct DisplayArmorIcon: View {
    var armor: ArmorListData
    var iconId: Int
    var weightId: Int
    var size: CGFloat
    
    var externalWeightData: [WeightType]
    var externalIconData: [IconsList]
    
    
    private func PopulateImage(armor: ArmorListData, iconType: String) -> Image {
        var name = "armorIcons/" + armor.prefix + iconType + armor.suffix
        
        if (iconType == "_ring_" || iconType == "_neck_") {
            var pref = "breton"
            var suff = "a"
            name = "armorIcons/" + pref + iconType + suff
        }
        var image: Image{ ImageStore.shared.image(name: name) }
        return image
    }
    
    var body: some View {
        VStack{
            
            ForEach(externalIconData) { icon in
                if (icon.id == self.weightId) {
                    ForEach(icon.icons) { list in
                        if (list.id == self.iconId) {
                            
                            self.PopulateImage(armor: self.armor, iconType: list.image_name)
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: self.size, height: self.size)
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("itemGold"), lineWidth: 2))
                                .padding(3)
                        }
                    }
                    
                }
            }
        }
        
    }
}

