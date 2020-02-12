//
//  BonusDesc.swift
//  EsoArmoury
//
//  Created by walnut on 10/10/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import SwiftUI

class BonusDescView: UIView {
    let bonusLabel  = UILabel()
    //bonusLabel.sizeToFit()
    
    
}

struct BonusDesc: UIViewRepresentable {
    var text: NSAttributedString
    
    func makeUIView(context: Context) -> BonusDescView {
        return BonusDescView()
    }
    
    func updateUIView(_ view: BonusDescView, context: Context) {
        view.bonusLabel.attributedText = text
    }
}

struct BonusDesc_Previews: PreviewProvider {
    static var previews: some View {
        BonusDesc(text: NSAttributedString(string: "When you deal damage, you have a 10% chance to call a murder of crows around you for 12 seconds. Every 3 seconds a crow will be sent to peck the closest enemy within 12 meters of you, dealing 4000 Physical Damage. This effect can occur once every 15 seconds."))
    }
}
