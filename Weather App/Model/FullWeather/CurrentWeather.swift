//
//  CurrentWeather.swift
//  Weather App
//
//  Created by Tarek on 21/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class CurrentWeather: Codable {
    var unixDate        : Double?
    var sunriseTime     : Double?
    var sunsetTime      : Double?
    var temperature     : Double?
    var feeling         : Double?
    var pressure        : Double?
    var humidity        : Double?
    var dewPoint        : Double?
    var uvi             : Double?
    var clouds          : Double?
    var visibility      : Double?
    var windSpeed       : Double?
    var windDeg         : Double?
    var weather         : [Weather] = []
    var rain            : Rain?
        
    enum CodingKeys: String, CodingKey {
        case unixDate        = "dt"
        case sunriseTime     = "sunrise"
        case sunsetTime      = "sunset"
        case temperature     = "temp"
        case feeling         = "feels_like"
        case pressure        = "pressure"
        case humidity        = "humidity"
        case dewPoint        = "dew_point"
        case uvi             = "uvi"
        case clouds          = "clouds"
        case visibility      = "visibility"
        case windSpeed       = "wind_speed"
        case windDeg         = "wind_deg"
        case weather         = "weather"
        case rain            = "rain"
    }
    
    init() {

    }

    required init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.unixDate        = try container.decodeIfPresent(Double.self, forKey: .unixDate)
        self.sunriseTime     = try container.decodeIfPresent(Double.self, forKey: .sunriseTime)
        self.sunsetTime      = try container.decodeIfPresent(Double.self, forKey: .sunsetTime)
        self.temperature     = try container.decodeIfPresent(Double.self, forKey: .temperature)
        self.feeling         = try container.decodeIfPresent(Double.self, forKey: .feeling)
        self.pressure        = try container.decodeIfPresent(Double.self, forKey: .pressure)
        self.humidity        = try container.decodeIfPresent(Double.self, forKey: .humidity)
        self.dewPoint        = try container.decodeIfPresent(Double.self, forKey: .dewPoint)
        self.uvi             = try container.decodeIfPresent(Double.self, forKey: .uvi)
        self.clouds          = try container.decodeIfPresent(Double.self, forKey: .clouds)
        self.visibility      = try container.decodeIfPresent(Double.self, forKey: .visibility)
        self.windSpeed       = try container.decodeIfPresent(Double.self, forKey: .windSpeed)
        self.windDeg         = try container.decodeIfPresent(Double.self, forKey: .windDeg)
        self.weather         = try container.decodeIfPresent([Weather].self, forKey: .weather) ?? []
        self.rain            = try container.decodeIfPresent(Rain.self, forKey: .rain)
    }
    
}
