//
//  Home.swift
//  EsoArmoury
//
//  Created by walnut on 9/6/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct Home: View {
    let rows = weightData
    
    var body: some View {
        NavigationView {
            WeightRow(items: weightData)
                .navigationBarTitle("ESO Armory", displayMode: .inline)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().colorScheme(.light)
    }
}
