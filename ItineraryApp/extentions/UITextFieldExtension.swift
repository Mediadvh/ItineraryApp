//
//  UITextFieldExtension.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/26/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

extension UITextField {

    var hasValue: Bool{
        guard text == "" else{ return true}
        
        // TODO: why doesn't the view get set to the correct size
                                 let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
                                 imageView.image = UIImage(named: "warningBlack")
                                 imageView.contentMode = .scaleAspectFit
                     
                                 rightView = imageView
                     
                                 rightViewMode = .always
                     
                     // Alternatives
                     
                     //tripTextField.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
                     
                     layer.borderColor = UIColor.red.cgColor
                     layer.borderWidth = 1
                     layer.cornerRadius = 5
                     
                     placeholder = "Invalid Input / Try Again"
        
        
        return false
    }

}
