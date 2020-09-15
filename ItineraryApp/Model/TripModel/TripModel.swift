//
//  Trips.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/10/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit
struct TripModel{
    
    var title:String
    var id:UUID
    var image : UIImage?
    var days = [DayModel]()
    init(title: String,image :UIImage? = nil) {
        
        id = UUID()
        self.title = title
        self.image = image
    }
}
