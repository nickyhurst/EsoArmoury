//
//  TabbarView.swift
//  EsoArmoury
//
//  Created by walnut on 9/17/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject private var userData: UserData
    //@ObservedObject var networkingManager = NetworkingManager()
    @State var selectedTab = Tab.complete

    enum Tab: Int {
        case home, complete, monster, latest
    }

    func tabbarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }
    
    func tabbarCustomItem(text: String, image: String) -> some View {
        VStack {
            Image(image)
                .resizable() 
                .renderingMode(.original)
                .foregroundColor(.green)
                .accentColor(.green)
                .frame(width: 50, height: 50)
                .padding(.top)
            Text(text)
        }
    }
    
    init() {
        print("TabBarView")
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            EntireArmorListView().tabItem{
                self.tabbarCustomItem(text:"Armory List", image: "fullList")
            }.tag(Tab.complete)
            
            Home().tabItem{
                self.tabbarCustomItem(text:"Content Type", image: "oroborusIcon")
            }.tag(Tab.home)
            
            ArmorListNavView(weight: 2004).tabItem{
                self.tabbarCustomItem(text:"Monster Sets", image: "monsterIcon")
            }.tag(Tab.monster)
            
            ArmorListNavView(weight: 3016).tabItem{
                self.tabbarCustomItem(text:"Latest DLC", image: "globeIcon")
            }.tag(Tab.latest)
            
//            TestDataView() {
//                self.tabbarCustomItem(text:"external", image: "globeIcon")
//            }.tag(Tab.latest)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
            .environment(\.colorScheme, .dark)
            	.environmentObject(UserData())
    }
}
