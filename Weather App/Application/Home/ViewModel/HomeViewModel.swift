//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    
    var currentCoutries: [Country] = []
    var forecast: BehaviorRelay<[FullWeather]> = .init(value: [])
    var temporalForecast: [FullWeather] = []
    
    
    override init(disposeBag: DisposeBag){
        super.init(disposeBag: disposeBag)
        getCountries()
        
        
    }
    
    func getCountries(){
        self.status.accept(.Loading)
        Request
            .GetCountries()
            .rx_dispatch()
            .subscribe(
                onNext: { [weak self] countries in
                        self?.currentCoutries = countries.second
                        countries.second.compactMap { [weak self] country in
                            self?.getFullWeather(for: country)
                        }
                    
                        
            },
                onError: { [weak self] error in
                    self?.status.accept(.Finished)
                    print(error.localizedDescription)
            }).disposed(by: self.disposeBag)
    }
    
    func getFullWeather(for country: Country) {
           guard let countryLat = country.latitude, let countryLon = country.longitude else {
               return
           }
           self.status.accept(.Loading)
           Request
               .GetFullWeather(latitude: countryLat, longitude: countryLon)
               .rx_dispatch()
               .subscribe(
                   onNext: { [weak self] fullWeather in
                    if let _ = fullWeather.current {
                        self?.temporalForecast.append(fullWeather)
                    }
            
                    if country.name == self?.currentCoutries.last?.name {
                        self?.forecast.accept(self?.temporalForecast ?? [])
                        self?.status.accept(.Finished)
                    }
                    
               },
                   onError: { [weak self] error in
                       self?.status.accept(.Finished)
               }).disposed(by: disposeBag)
       }
    
    
    
    
    
}
