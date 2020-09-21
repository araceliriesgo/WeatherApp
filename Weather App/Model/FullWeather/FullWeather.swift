//
//  FullWeather.swift
//  Weather App
//
//  Created by Tarek on 21/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class FullWeather: Codable {
    var latitude        : Double?
    var longitude       : Double?
    var timezone        : String?
    var timezoneOffset  : Double?
    var current         : CurrentWeather?
    var daily           : [DailyWeather]    = []
    var hourly          : [HourlyWeather]   = []
    var minutely        : [MinutelyWeather] = []
    
    enum CodingKeys: String, CodingKey {
        case latitude        = "lat"
        case longitude       = "lon"
        case timezone        = "timezone"
        case timezoneOffset  = "timezone_offset"
        case current         = "current"
        case daily           = "daily"
        case hourly          = "hourly"
        case minutely        = "minutely"
      
    }
    
    init() {

    }

    required init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude           = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.longitude          = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.timezone           = try container.decodeIfPresent(String.self, forKey: .timezone)
        self.timezoneOffset     = try container.decodeIfPresent(Double.self, forKey: .timezoneOffset)
        self.current            = try container.decodeIfPresent(CurrentWeather.self, forKey: .current)
        self.daily              = try container.decodeIfPresent([DailyWeather].self, forKey: .daily) ?? []
        self.hourly             = try container.decodeIfPresent([HourlyWeather].self, forKey: .hourly) ?? []
        self.minutely           = try container.decodeIfPresent([MinutelyWeather].self, forKey: .minutely) ?? []
    }

}
