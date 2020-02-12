//
//  ArmorList.swift
//  EsoArmoury
//
//  Created by walnut on 8/20/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct ArmorList: View {
    @State private var searchTerm: String = ""
    
    @ObservedObject private var selectedTag = TagSelectedMenuStore(selectedTag: .light)
    
    @ObservedObject private var contentTag = ContentTagSelectedMenuStore(selectedTag: .arena)
    
    
    
    private func tagView() -> some View {
        return ScollableSelector(items: TagMenu.allCases.map { $0.title() }, selection: Binding<Int>(
            get: {
                self.selectedTag.menu.rawValue
            },
            set: {
                self.selectedTag.menu = TagMenu(rawValue: $0)!
            })
        )
    }
    
    private func contentTypeView() -> some View {
        return ScollableSelector(items: ContentTypeMenu.allCases.map { $0.title() }, selection: Binding<Int>(
            get: {
                self.contentTag.menu.rawValue
            },
            set: {
                self.contentTag.menu = ContentTypeMenu(rawValue: $0)!
            })
        )
    }
    
//    private func contentTypeView() -> some View {
//        return ScollableSelector(items: ContentTypeMenu.allCases.map {
//            $0.title() }, selection: Binding<Int>(
//                get: {
//                    self.selectedTag.menu.rawValue
//            },
//                set: {
//                    self.selectedTag.menu = ContentTypeMenu(rawValue: $0)!
//            })
//        )
//    }
    
    var body: some View {
        //NavigationView {
            List {
                Section {
                    tagView()
                    
                }
                Section {
                    ZStack {
                        GetWeightData(id: self.selectedTag.menu.weightId())!.image
                        .resizable()
                            .renderingMode(.original)
                            .aspectRatio(nil, contentMode: .fill)
                            .frame(width:UIScreen.main.bounds.width * 0.9, height: 100, alignment: .top).clipped()
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                            .foregroundColor(.black)
                                .opacity(0.3)
                        VStack(alignment: .center) {
                            Text(GetWeightData(id: self.selectedTag.menu.weightId())!.weight + " Sets")
                                .foregroundColor(.white)
                                //.font(Font.custom("PlaneWalker", size: 32))
                                .font(.title)
                                .padding(.leading)
                                .padding(.bottom, 5)
                                .padding(.trailing)

                        }
                    }
                }
//                Section {
//                    Picker(selection: 1, label: Text("Weight")) {
//                            Text("Light Armor").tag(1)
//                            Text("Medium Armor").tag(2)
//                            Text("Heavy Armor").tag(3)
//                    }
//                }
                Section {
                    SearchBar(text: self.$searchTerm)
                }
                Section {
                    ForEach (armorData
                        .filter { self.searchTerm.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchTerm) }
                        .sorted(by: {$0.name < $1.name})
                    ) { armor in
                        ForEach(armor.armorTypes) { avail in
                            if (avail.id == self.selectedTag.menu.weightId()) {
                                NavigationLink(destination: ArmorDetail(armor: armor)) {
                                    WeightList(weightType: avail, armor: armor, passedWeight: self.selectedTag.menu.weightId())
                                }
                            }
                        }
                    }
                }
            }
            
        //}
    }
}


#if DEBUG
struct ArmorList_Previews: PreviewProvider {
    static var previews: some View {
        ArmorList().colorScheme(.dark)
    }
}
#endif
