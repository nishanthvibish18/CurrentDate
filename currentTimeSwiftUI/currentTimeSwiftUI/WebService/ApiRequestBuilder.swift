//
//  ApiRequestBuilder.swift
//  currentTimeSwiftUI
//
//  Created by Nishanth on 24/08/24.
//

import Foundation

struct ApiRequestBuilder{
    
    var currentDateRequestBuilder: ApiBuilder<CurrentDateModel>{
        return ApiBuilder(url: NetworkURL.currentDateURL.rawValue)
    }
}
