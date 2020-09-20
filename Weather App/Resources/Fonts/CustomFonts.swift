//
//  CustomFonts.swift
//  Weather App
//
//  Created by Tarek on 18/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import UIKit

enum CustomFont: String {
    case markProBlack   = "MarkPro-Black"
    case markProHeavy   = "MarkPro-Heavy"
    case markProBold    = "MarkPro-Bold"
    case markPro        = "MarkPro"
    case markProMedium  = "MarkPro-Medium"
}

extension UIFont {
    convenience init(customFont: CustomFont, size: CGFloat) {
        self.init(name: customFont.rawValue, size: size)!
    }
    
    static func printAllFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
}
