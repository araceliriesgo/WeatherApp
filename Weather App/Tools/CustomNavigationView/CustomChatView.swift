//
//  CustomChatView.swift
//  whereyouat
//
//  Created by Tarek on 11/06/2020.
//  Copyright © 2020 infinixsoft. All rights reserved.
//

import Foundation
import UIKit

class CustomChatView: BaseViewComponent {
    
    @IBOutlet var titleLabel: UILabel!
    
    
    func viewSetup(title: String){
        titleLabel.configure(text: title, textColor: .black, font: UIFont(customFont: .markProBold, size: 17))
    }
    
}
