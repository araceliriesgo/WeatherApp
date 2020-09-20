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
    
    private var currentCoutries: [Country] = []
    private var forecast: BehaviorRelay<[FullWeather]> = .init(value: [])
    private var temporalForecast: [FullWeather] = []
    
    
    override init(disposeBag: DisposeBag){
        super.init(disposeBag: disposeBag)
        getCountries()
        
        
    }
    
    func getCountries(){
        self.setStatus(value: .Loading)
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
                    self?.setStatus(value: .Finished)
                    print(error.localizedDescription)
            }).disposed(by: self.getDisposeBag())
    }
    
    
    func getFullWeather(for country: Country) {
           guard let countryLat = country.latitude, let countryLon = country.longitude else {
               return
           }
           self.setStatus(value: .Loading)
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
                        self?.setStatus(value: .Finished)
                    }
                    
               },
                   onError: { [weak self] error in
                       self?.setStatus(value: .Finished)
               }).disposed(by: self.getDisposeBag())
       }
    
    func getForecast() -> BehaviorRelay<[FullWeather]> {
        return self.forecast
    }
    
    
    
    
    
}
