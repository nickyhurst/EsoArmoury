//
//  Networker.swift
//  EsoArmoury
//
//  Created by walnut on 2/19/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation
protocol Networker {
    func request (_ urlPath: String, completion: @escaping (Result<Data, NSError>) -> Void)
}
