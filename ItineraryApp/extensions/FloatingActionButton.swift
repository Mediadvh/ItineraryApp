//
//  FloatingActionButton.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/14/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//



// IMPORTANT:

// custom class method

// we could have used extentions for UIButton like we did for UIView

// the diffrence between custom class method and extention method is  that we don't need to call any function when we use custom class we just need to change the type of the UI object which is a UIButton in this case


import UIKit
class FloatingActionButton: UIButton {

    
    override func draw(_ rect: CGRect) {
        
        // for more reusability,it is a good practice to change the Background color outside this class cause in other projects we don't have access to Theme class but if we were to do it here this would be the code
        // since the layer.backgroundcolor is a cg color we have:
        
        // TODO: when I set the background property outside this class
        // it does not work (WHY?)
           
        layer.backgroundColor = Theme.tint?.cgColor
        layer.shadowOpacity = 0.25
        layer.cornerRadius = frame.height / 2
        layer.shadowRadius = 5
        // positive width = up     negative width = down
        // positive height = down  negative height = up
        layer.shadowOffset = CGSize(width: 0, height: 10)
        
        
    
    
    }
    

}
