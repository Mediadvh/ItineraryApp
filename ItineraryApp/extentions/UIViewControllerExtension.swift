//
//  UIViewControllerExtension.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/26/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit
extension UIViewController{
    
    /**
       Just returns the initial view controller on a storyboard
     */
    static func getInstance() -> UIViewController{
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController()!
        }
    
}

