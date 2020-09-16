//
//  UITableViewCellExtensions.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/25/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit
extension UITableViewCell{
    
    // using class instead of static alows us to override this property in ourUITableView subclasses if we want
    
    /// Returns a string representation of this class
    class var identifier:String{
        return String(describing: self)
    }
    // computing property: a property that computes a value and returns it and it doesn't store it
    
}
