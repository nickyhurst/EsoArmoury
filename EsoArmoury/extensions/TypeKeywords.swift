//
//  TypeKeywords.swift
//  EsoArmoury
//
//  Created by walnut on 8/30/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct TypeKeywords: View {
    //@EnvironmentObject var store: Store<AppState>
    var weight: [ItemType]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach (weight) { item in
                    Text(item.desc)
 //                   NavigationLink(destination : ArmorList(displayedArmorId: item.id)) {
//                            Text(item.weight)
//                                .padding(.trailing, 10)
//                    }
                    
                }
            }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#if DEBUG
struct TypeKeywords_Previews: PreviewProvider {
    static var previews: some View {
        TypeKeywords(weight: weightData)
    }
}
#endif
