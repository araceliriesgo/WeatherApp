//
//  Clouds.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
struct Clouds: Codable {
    var all     : Float?
    
    
    enum CodingKeys: String, CodingKey {
        case all    = "all"
    }
}
