//
//  Trips.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/10/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit
class TripModel{
    var title:String
    var ID:UUID
    var image : UIImage?
    
    init(title: String,image :UIImage? = nil) {
        
        ID = UUID()
        self.title = title
        self.image = image
    }
}
