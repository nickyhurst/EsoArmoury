//
//  TestDataView.swift
//  EsoArmoury
//
//  Created by walnut on 2/4/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI

struct TestDataView: View {
    @EnvironmentObject var userData: UserData
//    @Binding var bonusesData: [BonusListEntry]
//    @Binding var armorDataList: [ArmorListData]
    
//    init(bonus: Binding<[BonusListEntry]>, armor: Binding<[ArmorListData]>) {
//        _bonusesData = bonus
//        _armorDataList = armor
//    }
//    init() {
//        //print(networkingManager.bonuses.count)
////        WebService().getEsoData {
////            print($0)
////        }
//    }
    var body: some View {
        VStack{
            Text("Hello")
//            Text(String(bonuses.externalArmorData.count))
//            List(bonuses.externalArmorData, id: \.id) { bonusItem in
//                Text("Hello")
//                Text(bonusItem.type)
//            }
            //Text(networkingManager.bonusList.count)
//            List(networkingManager., id: \.id) { items in
//                Text(items.desc)
//            }
//            List(userData.data.armor, id: \.id) { items in
//                Text(items.name)
//            }
//
//
//            List(userData.data.bonuses, id: \.id) { items in
//                Text(items.desc)
//            }
        }
//        List(d.externalArmorData) { data in
//
//            ForEach(data.results) { b in
//                Text(b.desc)
//            }
//            //Text(data.desc)
//        }
        
//        List(fetch.bonusList.results, id: \.id) { armor in
//            
//            //ForEach(armor.results, id: (\.id)) { bons in
//                Text(armor.desc)
//            //}
//        }
    }
}

struct TestDataView_Previews: PreviewProvider {
    static var previews: some View {
        TestDataView()
    }
}
