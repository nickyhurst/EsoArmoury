//
//  ScollableSelector.swift
//  EsoArmoury
//
//  Created by walnut on 9/3/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct ScollableSelector: View {
    let items: [String]
    @Binding var selection: Int
    
    func text(for index: Int) -> some View {
        Group {
            if index == selection {
                Text(items[index])
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(4)
                    .background(Color.green)
                    .cornerRadius(8)
                    .onTapGesture {
                        self.selection = index
                        //print("Clicked Current")
                    }
            } else {
                Text(items[index])
                    .font(.headline)
                    .foregroundColor(.primary)
                    .onTapGesture {
                        self.selection = index
                        //print("Clicked")
                }
            }
        }
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 12) {
                ForEach(0 ..< items.count) {
                    self.text(for: $0)
                }
                .frame(height: 50)
            }
            .padding(.leading, 4)
            .padding(.trailing, 4)
        }
    }
}

#if DEBUG
struct ScollableSelector_Previews: PreviewProvider {
    static var previews: some View {
        ScollableSelector(items: ["Light Armor", "Medium Armor", "Heavy Armor", "Arena", "Craftable", "Dungeon", "Thieves Guild", "Menu 8"],
        selection: .constant(1))
    }
}
#endif
