//
//  ArmorType.swift
//  EsoArmoury
//
//  Created by walnut on 10/24/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct ArmorType: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        ZStack {
           //BlurView(style: .systemMaterial)
            
            VStack {
                PaperDollSheet(userData: _userData)
                
                PaperDollData(userData: _userData)
                
               // Spacer()
            }
        }
    }
}

struct ArmorType_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ArmorType()
            //.environment(\.colorScheme, .dark)
            .environmentObject(userData)
        
    }
}
