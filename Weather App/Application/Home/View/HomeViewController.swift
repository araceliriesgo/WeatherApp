//
//  HomeViewController.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {


    @IBOutlet var refreshControl: UIActivityIndicatorView!
    @IBOutlet var collectionView: UICollectionView!
    
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar(title: "El Clima", addPop: false, titleContentMode: .center)
        self.activitySetup()
        self.bind()
        self.collectionViewSetup()

        
    }
    
    func bind() {
        
        self.viewModel = HomeViewModel(disposeBag: self.disposeBag)
        self.observerSetup()
    }

    func activitySetup(){
        self.refreshControl.color = .white
    }
    
    func showActivity(){
        self.refreshControl.isHidden = false
        self.refreshControl.startAnimating()
    }
           
    func hideActivity(){
        self.refreshControl.isHidden = true
        self.refreshControl.stopAnimating()
    }
    
    
    func reloadCollectionView(){
        self.collectionView.performBatchUpdates({
            let indexSet = IndexSet(integer: 0)
            self.collectionView.reloadSections(indexSet)
        }, completion: nil)
    }
    
    func observerSetup(){
        
    self.viewModel?
            .status
            .subscribe(
                onNext: { [weak self] status in
                    switch status {
                    case .Loading:
                        self?.showActivity()
                    default:
                        break
                        
                    }
            }).disposed(by: disposeBag)
        
    
        
       self.viewModel?
        .forecast
        .subscribe(
            onNext: { [weak self] fullWeather in
                if !fullWeather.isEmpty {
                    DispatchQueue.main.async {
                        self?.reloadCollectionView()
                        self?.hideActivity()
                    }
                    
                }
                
                print(fullWeather)
        }).disposed(by: disposeBag)
    }
  

}
