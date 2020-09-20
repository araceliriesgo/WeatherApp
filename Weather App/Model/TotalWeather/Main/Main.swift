//
//  Main.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
struct Main: Codable {
    var temp        : Float?
    var feeling     : Float?
    var minTemp     : Float?
    var maxTemp     : Float?
    var pressure    : Int?
    var humidity    : Int?
    var seaLevel    : Int?
    var grndLevel   : Int?
    var tempKf      : Int?
    
    enum CodingKeys: String, CodingKey {
        case temp        = "temp"
        case feeling     = "feels_like"
        case minTemp     = "temp_min"
        case maxTemp     = "temp_max"
        case pressure    = "pressure"
        case humidity    = "humidity"
        case seaLevel    = "sea_level"
        case grndLevel   = "grnd_level"
        case tempKf      = "temp_kf"
    }
    
}
