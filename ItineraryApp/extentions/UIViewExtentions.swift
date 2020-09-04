//
//  UIViewExtentions.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/13/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

extension  UIView {

     func addShadowAndRoundedCorners(){
        // changing the properties for the shadow
               
               // this is by default 0 we change it to 1 for the shadow to be visible
               layer.shadowOpacity = 1
               
               // puts the shadow in the center
               layer.shadowOffset = CGSize.zero
               
               // changing the color property
               // UIColor.darkGray is a UIColor
               // the shadowColor is CGColor(core graphic color)
               // so we use UIColor.darkGray.cgColor to set
               // it to shadow color
               layer.shadowColor = UIColor.darkGray.cgColor
               
               layer.cornerRadius = 10
    }

}
