//
//  Coordinate.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    var latitude    : Float?
    var longitude   : Float?
    
    enum CodingKeys: String, CodingKey {
        case latitude    = "lon"
        case longitude   = "lat"
    }
}
