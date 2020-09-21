//
//  Country.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class Country: Codable {
    var id          : String?
    var isoCode     : String?
    var name        : String?
    var latitude    : String?
    var longitude   : String?
        
        
    enum CodingKeys: String, CodingKey {
        case id          = "id"
        case isoCode     = "iso2Code"
        case name        = "name"
        case latitude    = "latitude"
        case longitude   = "longitude"
    }
    
    init () {
        
    }
    
    required init(from decoder: Decoder) throws {
        let container           = try decoder.container(keyedBy: CodingKeys.self)
        self.id                 = try container.decodeIfPresent(String.self, forKey: .id)
        self.isoCode            = try container.decodeIfPresent(String.self, forKey: .isoCode)
        self.name               = try container.decodeIfPresent(String.self, forKey: .name)
        self.latitude           = try container.decodeIfPresent(String.self, forKey: .latitude)
        self.longitude          = try container.decodeIfPresent(String.self, forKey: .longitude)
    }
    
    
    
}
