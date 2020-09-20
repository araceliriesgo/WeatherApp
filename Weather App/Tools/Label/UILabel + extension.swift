//
//  UILabel + extension.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

    func addShadowToCurrentLabel(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.masksToBounds = false
    }
    
    func configure(text: String, textColor: UIColor, font: UIFont) {
       
        self.font = font
        self.textColor = textColor
        self.text = text
    }
   
}
