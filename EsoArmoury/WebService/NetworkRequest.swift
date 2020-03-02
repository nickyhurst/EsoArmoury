//
//  NetworkRequest.swift
//  EsoArmoury
//
//  Created by walnut on 2/28/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func NRDecode(_ data: Data) -> ModelType?
    func NRLoad(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(self?.NRDecode(data))
        })
        task.resume()
    }
}


//
//fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
//    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
//    let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
//        guard let data = data else {
//            completion(nil)
//            return
//        }
//        completion(self?.decode(data))
//    })
//    task.resume()
//}
