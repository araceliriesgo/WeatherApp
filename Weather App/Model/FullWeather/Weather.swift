//
//  Weather.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var id          : Int?
    var main        : String?
    var description : String?
    var icon        : String?
    
    enum CodingKeys: String, CodingKey {
        case id          = "id"
        case main        = "main"
        case description = "description"
        case icon        = "icon"
    }
}

