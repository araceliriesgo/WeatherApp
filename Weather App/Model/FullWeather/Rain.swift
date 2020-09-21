//
//  Rain.swift
//  Weather App
//
//  Created by Tarek on 21/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class Rain: Codable {

    var lastHourRain    : Double?
    
    enum CodingKeys: String, CodingKey {
        case lastHourRain   = "1h"
    }
    
    init() {

    }

    required init(from decoder: Decoder) throws {
        let container       = try decoder.container(keyedBy: CodingKeys.self)
        self.lastHourRain   = try container.decodeIfPresent(Double.self, forKey: .lastHourRain)
    }
}
