//
//  WeatherCollectionViewCell.swift
//  Weather App
//
//  Created by Tarek on 19/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var weatherDescription: UILabel!
    @IBOutlet var weatherTitle: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var generalView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        generalView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    
    func configureCell(weather: DailyWeather, collectionViewFrame: CGRect) {
        
        
        generalView.heightAnchor.constraint(equalToConstant: collectionViewFrame.height).isActive = true

        
        if let date = weather.unixDate {
            self.date.configure(text: date.getDateStringFromUTC() , textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 15))
        }
        
        if let maxTemp = weather.temperature?.max, let minTemp = weather.temperature?.min {
            self.tempLabel.configure(text: "\(minTemp)-\(maxTemp)°C", textColor: CustomColors.pink, font: UIFont(customFont: .markProBold, size: 15))
        }
        
        if let title = weather.weather.first?.main {
            self.weatherTitle.configure(text: title, textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 13))
        }
        
        if let description = weather.weather.first?.description {
            self.weatherDescription.configure(text: description, textColor: CustomColors.subTitleGray, font: UIFont(customFont: .markProMedium, size: 11))
        }
        
        if let icon = weather.weather.first?.icon {
            self.weatherImage.getImageFromURL(imageUrl: getIconPath(with: icon))
            self.weatherImage.roundView(radius: 10)
            self.weatherImage.contentMode   = .scaleAspectFill
            self.weatherImage.clipsToBounds = true
        }
        
        
    }
    
    
    func getIconPath(with code: String) -> String {
        return "https://openweathermap.org/img/wn/\(code)@2x.png"
    }

}
