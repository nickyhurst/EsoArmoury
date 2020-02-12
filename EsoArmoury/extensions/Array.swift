//
//  Array.swift
//  EsoArmoury
//
//  Created by walnut on 9/6/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
