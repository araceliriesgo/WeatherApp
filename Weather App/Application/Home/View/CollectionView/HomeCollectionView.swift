//
//  HomeCollectionView.swift
//  Weather App
//
//  Created by Tarek on 19/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionViewSetup(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        let current = UINib(nibName: CellNames.WeatherDetail.getName(), bundle: nil)
        self.collectionView.register(current, forCellWithReuseIdentifier: CellNames.WeatherDetail.getName())

        
        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getViewModel()?.getForecast().value.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellNames.WeatherDetail.getName(), for: indexPath) as! WeatherDetailCollectionViewCell
        if let weather = self.getViewModel()?.getForecast().value[indexPath.row] {
            currentCell.configureCell(weather: weather)
        }
        return currentCell
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let weather = self.getViewModel()?.getForecast().value[indexPath.row]{
            let vc = CountryDetailViewController(weather: weather)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
