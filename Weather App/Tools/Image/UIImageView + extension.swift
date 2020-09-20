//
//  UIImageView + extension.swift
//  Weather App
//
//  Created by Tarek on 18/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func getImageFromURL(imageUrl: String) {
        if let imageURL = URL(string: imageUrl) {
            self.kf.setImage(with: imageURL)
        }
    }
    
    func cancelDownloadImage() {
        self.kf.cancelDownloadTask()
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
 

}
