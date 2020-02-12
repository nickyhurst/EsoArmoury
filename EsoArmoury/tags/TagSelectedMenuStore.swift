//
//  TagSelectedMenuStore.swift
//  EsoArmoury
//
//  Created by walnut on 9/3/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class TagSelectedMenuStore: ObservableObject {
    let pageListener : TagMenuPageListener
    
    @Published var menu: TagMenu {
        didSet {
            pageListener.menu = menu
        }
    }
    
    init(selectedTag: TagMenu) {
        self.menu = selectedTag
        self.pageListener = TagMenuPageListener(menu: selectedTag)
    }
}

final class ContentTagSelectedMenuStore: ObservableObject {
    let pageListener : ContentTypeMenuPageListener
    
    @Published var menu: ContentTypeMenu {
        didSet {
            pageListener.menu = menu
        }
    }
    
    init(selectedTag: ContentTypeMenu) {
        self.menu = selectedTag
        self.pageListener = ContentTypeMenuPageListener(menu: selectedTag)
    }
}
