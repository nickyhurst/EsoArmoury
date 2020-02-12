//
//  RootView.swift
//  EsoArmoury
//
//  Created by walnut on 2/10/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var userData: UserData
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
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            FullArmorListView().tabItem{
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
        }
        .edgesIgnoringSafeArea(.top)
        
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
