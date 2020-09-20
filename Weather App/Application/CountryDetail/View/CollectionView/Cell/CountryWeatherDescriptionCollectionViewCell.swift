//
//  CountryWeatherDescriptionCollectionViewCell.swift
//  Weather App
//
//  Created by Tarek on 19/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import UIKit

class CountryWeatherDescriptionCollectionViewCell: UICollectionViewCell {

    @IBOutlet var windSpeedTitleLabel: UILabel!
    @IBOutlet var cloudsTitleLabel: UILabel!
    @IBOutlet var atmTempTitleLabel: UILabel!
    
    @IBOutlet var humidityTitleLabel: UILabel!
    @IBOutlet var pressureTitleLabel: UILabel!
    @IBOutlet var feelingTitleLabel: UILabel!
    @IBOutlet var tempTitleLabel: UILabel!
    @IBOutlet var weatherDescription: UILabel!
    @IBOutlet var weatherTitle: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var cloudsLabel: UILabel!
    @IBOutlet var atmTempLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var feelingLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var generalView: UIView!
    
    
    var weather: FullWeather?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        generalView.translatesAutoresizingMaskIntoConstraints = false
        generalView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }

    
    func configureCell(weather: FullWeather) {
        self.weather = weather

        
        if let title = weather.current?.weather.first?.main {
            self.weatherTitle.configure(text: title, textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
        }
               
        if let description = weather.current?.weather.first?.description {
            self.weatherDescription.configure(text: description, textColor: CustomColors.subTitleGray, font: UIFont(customFont: .markProMedium, size: 15))
        }
               
        if let icon = weather.current?.weather.first?.icon {
            self.weatherImage.getImageFromURL(imageUrl: getIconPath(with: icon))
            self.weatherImage.roundView(radius: 10)
            self.weatherImage.contentMode   = .scaleAspectFill
            self.weatherImage.clipsToBounds = true
        }
        
        
        configureTitles()
        configureValues(from: weather)
        
        
    }
    
    func configureTitles(){
        windSpeedTitleLabel.configure(text: "Vel. viento", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
        cloudsTitleLabel.configure(text: "Nubosidad", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
        atmTempTitleLabel.configure(text: "Temp Atmosférica", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
        
        humidityTitleLabel.configure(text: "Humedad", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
        pressureTitleLabel.configure(text: "Presión", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
        feelingTitleLabel.configure(text: "Sensación", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
        tempTitleLabel.configure(text: "Temperatura", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
    }
    
    
    func configureValues(from weather: FullWeather){
        if let temp = weather.current?.temperature {
            self.tempLabel.configure(text: "\(temp)°C", textColor: CustomColors.pink, font: UIFont(customFont: .markProBold, size: 17))
        }
        
        if let feeling = weather.current?.feeling {
            self.feelingLabel.configure(text: "\(feeling)°C", textColor: CustomColors.pink, font: UIFont(customFont:   .markProBold, size: 17))
        }
                
        if let pressure = weather.current?.pressure {
            self.pressureLabel.configure(text: "\(pressure)hPa", textColor: CustomColors.pink, font: UIFont(customFont: .markProBold, size: 17))
        }

        if let humidity = weather.current?.humidity {
            self.humidityLabel.configure(text: "\(humidity)%", textColor: CustomColors.pink, font: UIFont(customFont: .markProBold, size: 17))
        }

        if let atmTemp = weather.current?.dewPoint {
            self.atmTempLabel.configure(text: "\(atmTemp)°C", textColor: CustomColors.pink, font: UIFont(customFont: .markProBold, size: 17))
        }

        if let clouds = weather.current?.clouds {
            self.cloudsLabel.configure(text: "\(clouds)%", textColor: CustomColors.pink, font: UIFont(customFont: .markProBold, size: 17))
        }

        if let windSpeed = weather.current?.windSpeed {
            self.windSpeedLabel.configure(text: "\(windSpeed)m/s", textColor: CustomColors.pink, font: UIFont(customFont: .markProBold, size: 17))
        }
    }
    
    
    func changeColorTo(to text: [String], in sentence: String) -> NSMutableAttributedString {
        let mutableString = NSMutableAttributedString(string: sentence)
        mutableString.addAttToTexts(attributes: [NSAttributedString.Key.foregroundColor: CustomColors.pink], textsToApply: text)
        return mutableString
    }

    func getIconPath(with code: String) -> String {
        return "https://openweathermap.org/img/wn/\(code)@2x.png"
    }
}




