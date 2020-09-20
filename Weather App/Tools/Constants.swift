//
//  Constants.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import UIKit

enum Constants: String {
    case WeatherApiKey  = "4442238a6ab6f77520690705fef074ea"
    
    func getValue() -> String {
        return rawValue
    }
}

enum RequestStatus {
    case Loading
    case Finished
    case Inactive
}


enum CellNames: String {
    case WeatherDescription = "CountryWeatherDescriptionCollectionViewCell"
    case WeatherDetail      = "WeatherDetailCollectionViewCell"
    case WeatherIcons       = "WeatherCollectionViewCell"
    
    func getName() -> String {
        return rawValue
    }
    
}
