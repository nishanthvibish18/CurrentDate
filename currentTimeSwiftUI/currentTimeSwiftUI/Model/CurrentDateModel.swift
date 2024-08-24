//
//  CurrentDateModel.swift
//  currentTimeSwiftUI
//
//  Created by Nishanth on 24/08/24.
//

import Foundation

struct CurrentDateModel: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
