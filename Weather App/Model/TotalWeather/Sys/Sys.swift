//
//  Sys.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

struct Sys: Codable {
    var type    : Int?
    var id      : Int?
    var country : String?
    var sunrise : Int?
    var sunset  : Int?
    
    enum CodingKeys: String, CodingKey {
        case type    = "type"
        case id      = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset  = "sunset"
    }
}
