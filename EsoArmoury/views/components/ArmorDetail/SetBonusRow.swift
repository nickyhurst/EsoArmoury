//
//  SetBonusRow.swift
//  EsoArmoury
//
//  Created by walnut on 8/22/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI
import UIKit

struct SetBonusRow: View {
   var bonus : [Bonus]
    //@State var childRect: CGRect = .zero
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(self.bonus, id: \.items) { set in
                HStack(alignment: .top) {
                    Text(set.items)
                        //.font(.subheadline)
                    
                    Highlight(text: GetBonusData(id: set.bonusId)!.desc)
                        //.font(.subheadline)
                }
            }
        }
    }
}

//var child = UIHostingController(rootView: SetBonusRow)

//extension SetBonusRow {
////    private func ColorTextString(main_string:String) -> Text {
////
////    }
//
//
//    private func ColorText(main_string:String) -> NSAttributedString {
//
//        let attribute = NSMutableAttributedString.init(string: main_string)
//
//        let SD_color = "Spell Damage"
//        let SD_range = (main_string as NSString).range(of: SD_color)
//        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue , range: SD_range)
//
//        let SC_color = "Spell Critical"
//        let SC_range = (main_string as NSString).range(of: SC_color)
//        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue , range: SC_range)
//
//        let WC_color = "Weapon Critical"
//        let WC_range = (main_string as NSString).range(of: WC_color)
//        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green , range: WC_range)
//
//        let MF_color = "Minor Force"
//        let MF_range = (main_string as NSString).range(of: MF_color)
//        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow , range: MF_range)
//
////        let l = UILabel()
////        l.attributedText = attribute
//
//        return attribute
//    }
//}


#if DEBUG
struct SetBonusRow_Previews: PreviewProvider {
    static var previews: some View {
        //SetBonusRow()
        SetBonusRow(bonus: armorData[80].bonus)
            .previewLayout(.fixed(width: 800, height: 400))
    }
}
#endif
