//
//  WeightRow.swift
//  EsoArmoury
//
//  Created by walnut on 8/29/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct WeightRow: View {
    var items:[ItemType]
    
    var body: some View {
        List {
//        GridRow()
            ForEach(weightData.dropFirst(9), id: \.self) { armorType in
                WeightDetail(weight: armorType)
            }
            VStack(alignment: .center) {
                Text("The Elder Scrolls Online developed by ZeniMax Online Studios LLC, a ZeniMax Media company. ZeniMax, The Elder Scrolls, ESO, Bethesda, Bethesda Softworks and related logos are registered trademarks or trademarks of ZeniMax Media Inc. in the US and/or other countries. All Rights Reserved.")
                .lineLimit(nil)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            }
            .padding(.leading, 10)
        }
    }
}

#if DEBUG
struct WeightRow_Previews: PreviewProvider {
    static var previews: some View {
        WeightRow(items: weightData)
    }
}
#endif
