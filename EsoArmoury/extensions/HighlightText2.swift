////
////  HighlightText2.swift
////  EsoArmoury
////
////  Created by walnut on 1/13/20.
////  Copyright © 2020 walnut. All rights reserved.
////
//
//import SwiftUI
//
//struct HighlightText2: View {
//    let text: String
//    let match: String
//    
//    init(_ text: String, match: String)
//    {
//        self.text = text
//        self.match = match
//    }
//    
//    var body: some View {
//        let tagged = text.replacingOccurrences(of: self.match, with: "<SPLIT>>\(self.match)<SPLIT>")
//        let split = tagged.components(separatedBy: "<SPLIT>")
//        return split.reduce(Text("")) { (a, b) -> Text in
//            guard !b.hasPrefix(">") else {
//                return a + Text(b.dropFirst()).foregroundColor(.red)
//            }
//            return a + Text(b)
//        }
//        
//        @State var matching = "ll"
////
//}
//
//struct HighlightText2_Previews: PreviewProvider {
//    static var previews: some View {
//        HighlightText(
//    }
//}
