//
//  ArmorViewModel.swift
//  EsoArmoury
//
//  Created by walnut on 2/4/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ArmorViewModel: ObservableObject {
    init() {
        fetchArmors()
    }
    
    var externalArmorData = [BonusListEntry](){
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchArmors() {
        WebService().getBonusData {
            self.externalArmorData = $0
            print($0)
        }
    }
    let didChange = PassthroughSubject<ArmorViewModel, Never>()
}
