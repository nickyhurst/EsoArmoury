//
//  TagRow.swift
//  EsoArmoury
//
//  Created by walnut on 9/3/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

struct TagRow: View {
    let item: TagMenu
    @Binding var selectedTag: TagMenu
    
    var isSelected: Bool {
        selectedTag == item
    }
    
    var body: some View {
        Text("Hello World")
//        Text(item.title)
//            .foregroundColor(isSelected ? .green : .primary)
//        .padding()
//            .onTapGesture {
//                self.selectedTag = self.item
        //}
    }
}

#if DEBUG
struct TagRow_Previews: PreviewProvider {
    static var previews: some View {
        TagRow(item: .light, selectedTag: .constant(.light))
    }
}
#endif
