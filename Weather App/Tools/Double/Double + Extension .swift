//
//  Double + Extension .swift
//  Weather App
//
//  Created by Tarek on 19/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    
    func getDateStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: self)

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .medium

        return dateFormatter.string(from: date)
    }
}
