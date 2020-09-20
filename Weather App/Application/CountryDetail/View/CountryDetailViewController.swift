//
//  CountryDetailViewController.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import UIKit

class CountryDetailViewController: BaseViewController {

    @IBOutlet var todayTitleLabel: UILabel!
    @IBOutlet var nextDaysTitleLabel: UILabel!
    @IBOutlet var currentCollectionView: UICollectionView!
    @IBOutlet var dailyCollectionView: UICollectionView!
    
    
    private var currentWeather  : FullWeather?
    
    init(weather: FullWeather) {
        super.init()
        self.currentWeather = weather
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let countryName = self.currentWeather?.timezone?.components(separatedBy: "/")[1] {
            self.configureNavigationBar(title: countryName, addPop: true, titleContentMode: .left)
        }
        configureViews()
        collectionViewSetup()

        
        // Do any additional setup after loading the view.
    }

    func getCurrentWeather() -> FullWeather? {
        return currentWeather
    }
    
    func configureViews(){
        self.nextDaysTitleLabel.configure(text: "Proximos días", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 20))
        
        self.todayTitleLabel.configure(text: "Actualmente", textColor: CustomColors.buttonBlue, font: UIFont(customFont: .markProBold, size: 20))
    }
    


}
