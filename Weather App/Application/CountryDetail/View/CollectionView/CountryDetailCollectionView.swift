//
//  CountryDetailCollectionView.swift
//  Weather App
//
//  Created by Tarek on 18/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import UIKit

extension CountryDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    enum Sections: Int, CaseIterable {
        case Description    = 0
        case Forecast
        
        func getIndex() -> Int {
            return rawValue
        }
    }
    
    func collectionViewSetup(){
        self.currentCollectionView.delegate = self
        self.dailyCollectionView.delegate = self
        
        self.currentCollectionView.dataSource = self
        self.dailyCollectionView.dataSource = self
     
        
        let description = UINib(nibName: CellNames.WeatherDescription.getName(), bundle: nil)
        self.currentCollectionView.register(description, forCellWithReuseIdentifier: CellNames.WeatherDescription.getName())
        
        
        let weather = UINib(nibName: CellNames.WeatherIcons.getName(), bundle: nil)
        self.dailyCollectionView.register(weather, forCellWithReuseIdentifier: CellNames.WeatherIcons.getName())

        
        if let collectionViewLayout = dailyCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        if let collectionViewLayout = currentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        self.dailyCollectionView.reloadData()
        self.currentCollectionView.reloadData()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.currentCollectionView:
            return 1
        case self.dailyCollectionView:
            return self.getCurrentWeather()?.daily.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.currentCollectionView:
            let descriptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellNames.WeatherDescription.getName(), for: indexPath) as! CountryWeatherDescriptionCollectionViewCell
            if let weather = self.getCurrentWeather() {
                descriptionCell.configureCell(weather: weather)
            }
            return descriptionCell
        case self.dailyCollectionView:
            let weatherCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellNames.WeatherIcons.getName(), for: indexPath) as! WeatherCollectionViewCell
            if let weather = self.getCurrentWeather()?.daily[indexPath.row]{
                weatherCell.configureCell(weather: weather, collectionViewFrame: self.dailyCollectionView.frame)
            }
            return weatherCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
