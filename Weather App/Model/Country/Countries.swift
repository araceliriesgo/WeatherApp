//
//  Countries.swift
//  Weather App
//
//  Created by Tarek on 21/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class Countries: Codable {
    var first: BasicData?
    var second: [Country] = []
    
    init() {
        
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.first = try container.decode(BasicData.self)
        self.second = try container.decode([Country].self)
    }
}
