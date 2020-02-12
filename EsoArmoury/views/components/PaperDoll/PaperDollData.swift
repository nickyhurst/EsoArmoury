//
//  PaperDollData.swift
//  EsoArmoury
//
//  Created by walnut on 1/10/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI



struct PaperDollData: View {
    @EnvironmentObject var userData: UserData
    
//    var availableArmor: [[String]]
//    var ActiveSets[0].activeBackWeap1 =
//
    
    
    
//    func CreateActiveSets() -> [ActiveSets]
//    {
//        let self.
//    }
    
   
    
    func CreateDataArray() -> [[ActiveArmor]]
    {
        return [self.userData.activeBackWeap1, self.userData.activeBackWeap2, self.userData.activeChest, self.userData.activeHand, self.userData.activeHead, self.userData.activeLegs, self.userData.activeNeck, self.userData.activeRing1, self.userData.activeRing2, self.userData.activeShoes, self.userData.activeShoulder, self.userData.activeWaist, self.userData.activeWeap1, self.userData.activeWeap2]
    }
    
    func GatherUniqueSets() -> [Armor] {
        let items = CreateDataArray()
        let selectedItems = items.compactMap{ $0.count == 1 ? $0[0].armor : nil }
        return Array(Set(selectedItems))
    }
    
    
    func PrintUniqueNames() -> [String] {
        let items = GatherUniqueSets()
        var setNames = [String]()
        if (items.count > 0)
        {
            for set in items  {
            //return List(items) { set in
                //return Text(set.name)
                setNames.append(set.name)
                //names.insert(setItem.name, at: id())
            }
        }
        return setNames
    }
    
//    init(availableTitles: [String]) {
//        self.availableTitles = PrintUniqueNames()
//    }
    
    //func Display
        
        //selectedItems.map({ $0.id }) //.reduce{ $0.id }
//        let uniqueSets = items.compactMap({ (item: [ActiveArmor]) -> Int in
//            return item[0].armor.id
//        })
        
        
//        let unique = items.compactMap{ $0 }
//        let setsCount = unique.map{ item in
//            return item
//        }
        
        //return name
    //}
   
    var body: some View {
        //var sets = GatherUniqueSets()
        VStack {
            
            VStack(alignment: .leading) {
                //PrintUniqueNames()
//                ForEach(GatherUniqueSets()) { set in
//                    Text(set[0].name)
//                }
//
                //if let setTitles = PrintUniqueNames() {
//                ForEach(self.availableTitles { name in
//                        Text(name)
//                    })
                //}
                
                //ForEach{set}


//                for set in GatherUniqueSets()
//                {
//
//                    Text(set.id)
//                }
                
//                ForEach(GatherUniqueSets() { set in
//                    Text(set)
//                })
               
                
                //Text(String(GatherUniqueSets()))
                
                //Text(self.userData.activeBackWeap1
                
                VStack(alignment: .leading) {
                    Highlight(text: "5x Archer's Mind")
                        .font(.footnote)
                    Highlight(text: "5x New Moon Acolyte")
                        .font(.footnote)
                    Highlight(text: "2x BloodSpawn")
                        .font(.footnote)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Highlight(text: "Adds 1096 Max Stamina")
                        .font(.footnote)
                    
                    Highlight(text: "Adds 833 Weapon Critical")
                        .font(.footnote)
                    
                    Highlight(text: "Adds 833 Weapon Critical")
                        .font(.footnote)
                    
                    Highlight(text: "Increases your Crictical Damage by 5%.  Increases your Critical Damage by an additional 10% when attacking from Sneak or invisibilty.")
                        .lineLimit(nil)
                        .font(.footnote)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Highlight(text: "Adds 833 Weapon Critical and Spell Critical")
                        .font(.footnote)
                    
                    Highlight(text: "Adds 129 Weapon Damage and Spell Damage")
                        .font(.footnote)
                    
                    Highlight(text: "Adds 1487 Physical Penetration and Spell Penetration")
                        .font(.footnote)
                    
                    Highlight(text: "Adds 481 Weapon Damage and Spell Damage.  Increase the cost of your active abilities by 5%.")
                        .lineLimit(nil)
                        .font(.footnote)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Highlight(text: "Adds 129 Stamina Recovery")
                        .font(.footnote)
                    
                    Highlight(text: "When you take damage, you have a 6% chance to generate 14 Ultimate and increase your Physical Resistance and Spell Resistance by 6450 for 6 seconds.  This effect can occur every 6 seconds.")
                        .font(.footnote)
                        .lineLimit(nil)
                }
                .padding(.bottom)
                
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .padding(.horizontal)
            .background(BlurView(style: .systemMaterial))
            .shadow(radius: 20)
        }
    }
    
}


struct PaperDollData_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PaperDollData()
            .environmentObject(userData)
    }
}

struct InvisSpacer: View {
    var body: some View {
        Rectangle()
            .frame(width: 60, height: 6)
            .opacity(0.0)
    }
}
