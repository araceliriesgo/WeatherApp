//
//  MinutelyWeather.swift
//  Weather App
//
//  Created by Tarek on 21/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class MinutelyWeather: Codable {
    var unixDate        : Double?
    var precipitation   : Double?
    
    enum CodingKeys: String, CodingKey {
        case unixDate        = "dt"
        case precipitation   = "precipitation"
    }
    
    init() {

    }

    required init(from decoder: Decoder) throws {
        let container       = try decoder.container(keyedBy: CodingKeys.self)
        self.unixDate       = try container.decodeIfPresent(Double.self, forKey: .unixDate)
        self.precipitation  = try container.decodeIfPresent(Double.self, forKey: .precipitation)
    }
}
