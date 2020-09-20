//
//  BaseViewModel.swift
//  Weather App
//
//  Created by Tarek on 17/09/2020.
//  Copyright © 2020 Tarruk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class BaseViewModel {
    
    var disposeBag: DisposeBag
    
    var status: BehaviorRelay<RequestStatus> = .init(value: .Inactive)
    
    
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag
    }
    
    
}
