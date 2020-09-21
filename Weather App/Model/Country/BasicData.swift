//
//  BasicData.swift
//  Weather App
//
//  Created by Tarek on 21/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

class BasicData: Codable {
    var page    : Int?
    var pages   : Int?
    var perPage : String?
    var total   : Int?
    
    enum CodingKeys: String, CodingKey {
        case page    = "page"
        case pages   = "pages"
        case perPage = "per_page"
        case total   = "total"
    }
    
    init() {
        
    }
    
    required init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.page       = try container.decodeIfPresent(Int.self, forKey: .page)
        self.pages      = try container.decodeIfPresent(Int.self, forKey: .pages)
        self.perPage    = try container.decodeIfPresent(String.self, forKey: .perPage)
        self.total      = try container.decodeIfPresent(Int.self, forKey: .total)
    }
}
