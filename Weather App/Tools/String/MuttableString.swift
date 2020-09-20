//
//  MuttableString.swift
//  Weather App
//
//  Created by Tarek on 19/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    func addAttToTexts(attributes: [NSAttributedString.Key : Any], textsToApply: [String]) {
        for littleText in textsToApply {
            if let range = self.string.range(of: littleText)?.nsRange {
                self.addAttributes(attributes, range: range)
            }
        }
    }
}


extension Range where Bound == String.Index {
    var nsRange:NSRange {
        return NSRange(location: self.lowerBound.encodedOffset,
                       length: self.upperBound.encodedOffset -
                        self.lowerBound.encodedOffset)
    }
}
