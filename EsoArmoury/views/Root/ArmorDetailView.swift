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
    @ObservedObject var nm = NetworkingManager()
    var armor: ArmorListData
    
    
    var body: some View {
        List {
            
            ArmorTitleView(userData: _userData, armor: armor)
            
            ArmorLocationView(armor: armor)
            
            Section(header: Text("Set Bonus")) {
                ArmorBonusRowView(bonus: self.armor.bonus)
                    .font(.subheadline)
            }
            
            Section(header: Text("Available as:")) {
                ArmorAvailableIconDisplayView(armor: armor)
            }
        }
    }
}

struct ArmorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArmorDetailView(armor: NetworkingManager().armor[0])
    }
}


struct ArmorTitleView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var nm = NetworkingManager()
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


struct ArmorAvailableIconDisplayView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var nm = NetworkingManager()
    @State var showModal = false
    var armor: ArmorListData
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(self.nm.iconList) { icon in
                IconRow(icon: icon, armor: self.armor)
            }
        }
    }
}

struct IconRow: View {
    @ObservedObject var nm = NetworkingManager()
    var icon: IconsList
    var armor: ArmorListData
    
    func GetIconName(id: Int) -> Text {
       for (_, array) in nm.weights.enumerated()
       {
           if (array.id == id) {
               return Text(array.subText)
           }
       }
       return Text("Weight not found")
   }


    func IconsFromWeightId(id: Int) -> IconsList? {
        print(nm.iconList.count)
        for(c, array) in nm.iconList.enumerated()
        {
            print(c)
            print("Icon List ID:")
            print(array.id)
            if (array.id == id) {
                return array.self
            }
            //return array.where({$0 == id)})
                
        }
        return IconsList(id: 0, icons: [IconItemView(id: 0, image_name: "none")])
        }
    
    func IconNameFromWeightId(id: Int, icons: IconsList) -> String {
        print(icons.id)
        print(id)
        return icons.icons.filter({ $0.id == id}).first!.image_name
    }

    func IconWeightName(weightId: Int, itemId: Int) -> String {
        let icons = IconsFromWeightId(id: weightId)
        let imageName = IconNameFromWeightId(id: itemId, icons: icons!)
        //print(icons)
//        for(_, array) in nm.iconList.enumerated()
//        {
//            return array.icons.filter({ $0.id == weightId}).first?.image_name ?? "no image"
//        }
//        return "no image"
        return imageName
//
//        print("Weight : " + String(weightId))
//        print("Item : " + String(itemId))
//        let armorList = NetworkingManager().icons
//        print(armorList.count)
//        let iconList = nm.icons.enumerated()
//        print(iconList)
//        let icons = IconsFromWeightId(id: weightId)
//
//        //print(String(icons?.id)
//        let imageName = IconNameFromWeightId(id: itemId, icons: icons!)
//        return imageName
    }
    
    
   
    
    var body: some View {
        VStack {
            ForEach(armor.armorTypes) { armorType in
                
                if (armorType.id == self.icon.id) {
                    
                    VStack(alignment: .leading) {
                        self.GetIconName(id: armorType.id)
                        
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach(self.icon.icons) { style in
                                    
                                    Text(self.armor.prefix)
                                    Text(self.armor.suffix)
                                    Text(String(self.icon.id))
                                    Text(String(style.id))
                                    Text(self.IconWeightName(weightId: self.icon.id, itemId: style.id))
                                    
//                                    DisplayArmorIcon(armor: self.armor, iconId: style.id, weightId: self.icon.id, size: 50)
//
//                                    DisplayArmorIcon(armor: self.armor, iconId: style.id, weightId: self.icon.id, iconList: self.nm.iconList, size: 50)
                                    
                                    
                     
                                    
//                                    DisplayArmorIcon(armor: ArmorListData, prefix: self.armor.prefix, suffix: self.armor.suffix, iconId: style.id, weightId: self.icon.id, size: 50)
                                    
//                                    DisplayArmorIcon(armor: self.armor, iconType:
//                                        self.IconWeightName(weightId: self.icon.id, itemId: style.id), size: 50)
                                }
                            }
                        }
                        //Text(String(type.id))
                    }
                }
            }
        }
    }
}

struct DisplayArmorIcon: View {
    @ObservedObject var nm = NetworkingManager()
    var iconList = NetworkingManager().iconList
    var armor: ArmorListData
    var iconId: Int
    var weightId: Int
    //var iconList: [IconsList]
    
    
    
    
//    var iconType: String
    var size: CGFloat
    
    func GetIconTypeFromWeight(weightId: Int, netM: [IconsList]) -> IconsList? {
        
        //print(netM.armor.count)
        return netM.filter( { $0.id == weightId }).first
    }
    
    func GetIconName(itemId: Int, icons: IconsList) -> String {
        return icons.icons.filter( { $0.id == itemId }).first!.image_name
    }
    
    func GetIconType(iconId: Int, weightId: Int, netM : [IconsList]) -> String {
        let icons = GetIconTypeFromWeight(weightId: weightId, netM: nm.iconList)
        
        let imageName = GetIconName(itemId: iconId, icons: icons!)
        
        return imageName
    }
//
//        print(d?.id as Any)
//
//        for (c, array) in nm.icons.enumerated()
//        {
//            print(c)
//            print(array.id)
//            if (array.id == weightId) {
//                imageName =  array.icons.filter({ $0.id == iconId}).first!.image_name
//                print(imageName)
//                //return imageName
//            }
//        }
//        return imageName
//    }
    
    
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
        
        self.PopulateImage(armor: armor, iconType: GetIconType(iconId: iconId, weightId: weightId, netM: nm.iconList))
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

