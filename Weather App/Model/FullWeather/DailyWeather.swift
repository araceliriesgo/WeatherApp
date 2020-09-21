//
//  DailyWeather.swift
//  Weather App
//
//  Created by Tarek on 21/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class DailyWeather: Codable {
    
    var unixDate        : Double?
    var sunriseTime     : Double?
    var sunsetTime      : Double?
    var temperature     : DailyTemp?
    var feeling         : DailyFeeling?
    var pressure        : Double?
    var humidity        : Double?
    var dewPoint        : Double?
    var windSpeed       : Double?
    var windDeg         : Double?
    var weather         : [Weather] = []
    var clouds          : Double?
    var pop             : Double?
    var rain            : Double?
    var uvi             : Double?
    
    
    enum CodingKeys: String, CodingKey {
        case unixDate        = "dt"
        case sunriseTime     = "sunrise"
        case sunsetTime      = "sunset"
        case temperature     = "temp"
        case feeling         = "feels_like"
        case pressure        = "pressure"
        case humidity        = "humidity"
        case dewPoint        = "dew_point"
        case windSpeed       = "wind_speed"
        case windDeg         = "wind_deg"
        case weather         = "weather"
        case clouds          = "clouds"
        case pop             = "pop"
        case rain            = "rain"
        case uvi             = "uvi"
    }
    
    init() {

    }

    required init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.unixDate        = try container.decodeIfPresent(Double.self, forKey: .unixDate)
        self.sunriseTime     = try container.decodeIfPresent(Double.self, forKey: .sunriseTime)
        self.sunsetTime      = try container.decodeIfPresent(Double.self, forKey: .sunsetTime)
        self.temperature     = try container.decodeIfPresent(DailyTemp.self, forKey: .temperature)
        self.feeling         = try container.decodeIfPresent(DailyFeeling.self, forKey: .feeling)
        self.pressure        = try container.decodeIfPresent(Double.self, forKey: .pressure)
        self.humidity        = try container.decodeIfPresent(Double.self, forKey: .humidity)
        self.dewPoint        = try container.decodeIfPresent(Double.self, forKey: .dewPoint)
        self.clouds          = try container.decodeIfPresent(Double.self, forKey: .clouds)
        self.windSpeed       = try container.decodeIfPresent(Double.self, forKey: .windSpeed)
        self.windDeg         = try container.decodeIfPresent(Double.self, forKey: .windDeg)
        self.weather         = try container.decodeIfPresent([Weather].self, forKey: .weather) ?? []
        self.rain            = try container.decodeIfPresent(Double.self, forKey: .rain)
        self.uvi             = try container.decodeIfPresent(Double.self, forKey: .uvi)
        self.pop             = try container.decodeIfPresent(Double.self, forKey: .pop)
    }
    
}
