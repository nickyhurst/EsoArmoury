//
//  TagMenuPageListener.swift
//  EsoArmoury
//
//  Created by walnut on 9/3/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import Foundation


final class TagMenuPageListener : TagListener {
    var menu: TagMenu {
        didSet {
            selectedPage = 1
        }
    }
    
//    override func loadPage() {
//         ArmorList(displayedArmorId: selectedPage)
//    }
//
    
    init(menu: TagMenu) {
        self.menu = menu
        
        super.init()
        
        //loadPage()
    }
}


final class ContentTypeMenuPageListener : TagListener {
    var menu: ContentTypeMenu {
        didSet {
            selectedPage = 1
        }
    }
    
    init(menu: ContentTypeMenu) {
        self.menu = menu
        super.init()
    }
}
