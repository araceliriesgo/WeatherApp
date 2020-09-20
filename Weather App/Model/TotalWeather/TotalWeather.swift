//
//  TotalWeather.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation






struct TotalWeather: Codable {
    var id          : Int?
    var name        : String?
    var cod         : Int?
    var timeZone    : Int?
    var coordinate  : Coordinate?
    var weather     : [Weather] = []
    var base        : String?
    var main        : Main?
    var visibility  : Int?
    var wind        : Wind?
    var clouds      : Clouds?
    var dt          : Int?
    var sys         : Sys?
        
    enum CodingKeys: String, CodingKey {
        case id          = "id"
        case name        = "name"
        case cod         = "cod"
        case timeZone    = "timezone"
        case coordinate  = "coord"
        case weather     = "weather"
        case base        = "base"
        case main        = "main"
        case visibility  = "visibility"
        case wind        = "wind"
        case clouds      = "clouds"
        case dt          = "dt"
        case sys         = "sys"
    }
    
//    init() {
//
//          }
//
//    required init(from decoder: Decoder) throws {
//        let container   = try decoder.container(keyedBy: CodingKeys.self)
//        self.id         = try container.decodeIfPresent(Int.self, forKey: .id)
//        self.name       = try container.decodeIfPresent(String.self, forKey: .name)
//        self.cod        = try container.decodeIfPresent(Int.self, forKey: .cod)
//        self.timeZone   = try container.decodeIfPresent(Int.self, forKey: .timeZone)
//        self.coordinate = try container.decodeIfPresent(Coordinate.self, forKey: .coordinate)
//        self.weather    = try container.decodeIfPresent([Weather].self, forKey: .weather) ?? []
//        self.base       = try container.decodeIfPresent(String.self, forKey: .base)
//        self.main       = try container.decodeIfPresent(Main.self, forKey: .main)
//        self.visibility = try container.decodeIfPresent(Int.self, forKey: .visibility)
//        self.wind       = try container.decodeIfPresent(Wind.self, forKey: .wind)
//        self.clouds     = try container.decodeIfPresent(Clouds.self, forKey: .clouds)
//        self.dt         = try container.decodeIfPresent(Int.self, forKey: .dt)
//        self.sys        = try container.decodeIfPresent(Sys.self, forKey: .sys)
//   }
  
}


struct FullWeather: Codable {
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

}

struct Rain: Codable {
    var lastHourRain    : Double?
    enum CodingKeys: String, CodingKey {
        case lastHourRain   = "1h"
    }
}




//MARK: - Current -
struct CurrentWeather: Codable {
    var unixDate        : Int?
    var sunriseTime     : Int?
    var sunsetTime      : Int?
    var temperature     : Double?
    var feeling         : Double?
    var pressure        : Int?
    var humidity        : Int?
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
    
}







//MARK: - Minutely -
struct MinutelyWeather: Codable {
    var unixDate        : Int?
    var precipitation   : Double?
    
    enum CodingKeys: String, CodingKey {
        case unixDate        = "dt"
        case precipitation   = "precipitation"
    }
}






//MARK: - Hourly -
struct HourlyWeather: Codable {
    var unixDate        : Int?
    var temperature     : Double?
    var feeling         : Double?
    var pressure        : Double?
    var humidity        : Double?
    var dewPoint        : Double?
    var clouds          : Double?
    var visibility      : Int?
    var windSpeed       : Double?
    var windDeg         : Double?
    var weather         : [Weather] = []
    var pop             : Double?
    
    enum CodingKeys: String, CodingKey {
       case unixDate        = "dt"
       case temperature     = "temp"
       case feeling         = "feels_like"
       case pressure        = "pressure"
       case humidity        = "humidity"
       case dewPoint        = "dew_point"
       case clouds          = "clouds"
       case visibility      = "visibility"
       case windSpeed       = "wind_speed"
       case windDeg         = "wind_deg"
       case weather         = "weather"
       case pop             = "pop"
    }

}




//MARK: - Daily -
struct DailyWeather: Codable {
    
    var unixDate        : Double?
    var sunriseTime     : Int?
    var sunsetTime      : Int?
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
    
}

struct DailyTemp: Codable {
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
}

struct DailyFeeling: Codable {
    var day     : Double?
    var night   : Double?
    var evening : Double?
    var morning : Double?
    
    enum CodingKeys: String, CodingKey {
        case day     = "day"
        case night   = "night"
        case evening = "eve"
        case morning = "morn"
    }
}
