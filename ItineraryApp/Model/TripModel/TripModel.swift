//
//  Trips.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/10/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import Foundation
class TripModel{
    var title:String
    var ID:UUID
    
    init(title: String) {
        
        ID = UUID()
        self.title = title
    }
}
