//
//  UIView + Extension.swift
//  Weather App
//
//  Created by Tarek on 19/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation

import UIKit

extension UIView {
    
    func roundView(radius: Float){
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
    }
}
