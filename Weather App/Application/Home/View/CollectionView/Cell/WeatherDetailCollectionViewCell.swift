//
//  WeatherDetailCollectionViewCell.swift
//  Weather App
//
//  Created by Tarek on 19/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import UIKit

class WeatherDetailCollectionViewCell: UICollectionViewCell {


    @IBOutlet var feelingLabel: UILabel!
    @IBOutlet var feelingTitleLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
   
    @IBOutlet var generalView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        generalView.translatesAutoresizingMaskIntoConstraints = false
        generalView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }

    func configureCell(weather: FullWeather){
        guard let cityName = weather.timezone?.components(separatedBy: "/")[1] else {
            return
        }
        
    
        self.titleLabel.configure(text: cityName, textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 17))
        if let temp = weather.current?.temperature {
            self.tempLabel.configure(text:"\(temp)°C", textColor: CustomColors.pink, font: UIFont(customFont: .markProHeavy, size: 25))
        }
       
        
        
        self.feelingTitleLabel.configure(text: "Sensación: ", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProMedium, size: 15))
        
        
        
        if let feeling = weather.current?.feeling {
            self.feelingLabel.configure(text: "\(feeling)°C", textColor: CustomColors.pink, font: UIFont(customFont: .markProMedium, size: 15))
          
        }
    }
    
  
    
}
