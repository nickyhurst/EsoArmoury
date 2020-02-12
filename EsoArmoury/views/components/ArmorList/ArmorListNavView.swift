//
//  ArmorListNavView.swift
//  EsoArmoury
//
//  Created by walnut on 9/17/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct ArmorListNavView: View {
    @EnvironmentObject var userData: UserData
    @State private var searchTerm: String = ""
    
    var weight: Int
    
    var body: some View {
        
        NavigationView {
            ArmorListView(weight: weight)
                .navigationBarTitle(Text(weightName(id: weight)), displayMode: .inline)
                
        }
    }
}

struct ArmorListNavView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ArmorListNavView(weight: 1003)
            .environmentObject(userData)
    }
}
