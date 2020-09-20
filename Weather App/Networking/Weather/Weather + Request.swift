//
//  Weather + Request.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

extension Request {
    
    struct GetFullWeather: NetworkCaseType {
        var request: RequestData
        typealias ResponseType = FullWeather
        let path = "https://api.openweathermap.org/data/2.5/onecall"
        
        init(latitude: String, longitude: String) {
            let params: [String : Any] = [
                "lat"       : latitude,
                "lon"       : longitude,
                "appid"     : Constants.WeatherApiKey.getValue(),
                "units"     : "metric",
                "lang"      : "es"
                
            ]
            request = RequestData(path: path, method: .get, parameters: params)
        }
        
    }
}
