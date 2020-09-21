//
//  DailyTemp.swift
//  Weather App
//
//  Created by Tarek on 21/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class DailyTemp: Codable {
    var day     : Double?
    var min     : Double?
    var max     : Double?
    var night   : Double?
    var evening : Double?
    var morning : Double?
    
    enum CodingKeys: String, CodingKey {
        case day     = "day"
        case min     = "min"
        case max     = "max"
        case night   = "night"
        case evening = "eve"
        case morning = "morn"
    }
    
    init() {

    }

    required init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.day            = try container.decodeIfPresent(Double.self, forKey: .day)
        self.min            = try container.decodeIfPresent(Double.self, forKey: .min)
        self.max            = try container.decodeIfPresent(Double.self, forKey: .max)
        self.night          = try container.decodeIfPresent(Double.self, forKey: .night)
        self.evening        = try container.decodeIfPresent(Double.self, forKey: .evening)
        self.morning        = try container.decodeIfPresent(Double.self, forKey: .morning)
    }
}
