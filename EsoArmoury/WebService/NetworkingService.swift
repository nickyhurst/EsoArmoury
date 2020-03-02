//
//  NetworkingService.swift
//  EsoArmoury
//
//  Created by walnut on 2/19/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation

class NetworkingService {
    
    private init() {}
    static let shared = NetworkingService()
    
    func request(_ urlPath: String, completion: @escaping (Result<Data, NSError>) -> Void) {
        let url = URL(string: urlPath)!
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, error) in
            
            if let unwrappedError = error {
                completion(.failure(unwrappedError as NSError))
            } else if let unwrappedError = data {
                completion(.success(unwrappedError))
            }
        }
        
        task.resume()
    }
}

