//
//  Wind.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
struct Wind: Codable {
    var speed   : Float?
    var deg     : Float?
    
    enum CodingKeys: String, CodingKey {
        case speed   = "speed"
        case deg     = "deg"
    }
}
