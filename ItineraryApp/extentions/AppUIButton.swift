//
//  AppUIButton.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/14/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        
        layer.backgroundColor = Theme.tint?.cgColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
        
        
        
    }
}
