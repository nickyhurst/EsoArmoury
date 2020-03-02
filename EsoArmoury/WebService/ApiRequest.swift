//
//  ApiRequest.swift
//  EsoArmoury
//
//  Created by walnut on 2/28/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation

class ApiRequest<Resource: ApiResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension ApiRequest: NetworkRequest {
    func NRDecode(_ data: Data) -> Array<Resource.ModelType>? {
        let wrapper = try? JSONDecoder().decode([Resource.ModelType].self, from: data)
        return wrapper
    }
    
    func NRLoad(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        
        NRLoad(withCompletion: completion)
    }
}
