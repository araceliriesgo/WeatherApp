//
//  BaseViewController.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import CoreLocation



class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    enum TitleContentMode {
        case left
        case center
    }
    
    init() {
           super.init(nibName: String(describing: type(of: self)), bundle: nil)
       }
       
       required init?(coder: NSCoder) {
           fatalError()
       }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    
    func configureNavigationBar(title: String,addPop: Bool? = false, titleContentMode: TitleContentMode? = .center){
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.barStyle = .black
        
        if addPop == true {
            let popButton = UIBarButtonItem(image: #imageLiteral(resourceName: "popButton").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(popViewController))
            switch titleContentMode {
            case .left:
                let titleButton = UIBarButtonItem(customView: self.createLabelView(title: title))
                navigationItem.leftBarButtonItems = [popButton, titleButton]
            case .center:
                navigationItem.leftBarButtonItem = popButton
                navigationItem.titleView = self.createLabelView(title: title)
            default:
                let titleButton = UIBarButtonItem(customView: self.createLabelView(title: title))
                navigationItem.leftBarButtonItems = [popButton, titleButton]
            }
        } else {
            navigationItem.titleView = self.createLabelView(title: title)
        }
       
        
        
    }
    
    func getIconPath(with code: String) -> String {
        return "https://openweathermap.org/img/wn/\(code)@2x.png"
    }
    
    func createLabelView(title: String) -> UIView {
        let view = CustomChatView()
        view.viewSetup(title: title)
        return view
    }
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
