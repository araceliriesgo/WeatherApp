//
//  Country + Request.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

extension Request {
    
    struct GetCountries: NetworkCaseType {
        var request: RequestData
        typealias ResponseType = Countries
        let path = "https://api.worldbank.org/v2/country?format=JSON"
        
        
        init(){
            request = RequestData(path: path, method: .get)
        }
        
        
    }
    
    
    
  
}
