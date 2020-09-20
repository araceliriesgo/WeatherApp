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
    
    private var disposeBag: DisposeBag
    
    private var status: BehaviorRelay<RequestStatus> = .init(value: .Inactive)
    
    
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag
    }
    
    func getStatus() -> BehaviorRelay<RequestStatus> {
        return status
    }
    
    func setStatus(value: RequestStatus) {
        self.status.accept(value)
    }
    
    func getDisposeBag() -> DisposeBag {
        return self.disposeBag
    }
}
