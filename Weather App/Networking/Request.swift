//
//  Request.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

struct Request{
    
    func createPath(_ path: String) -> String {
        
        let base = ""
        
        return base + path
    }

}
