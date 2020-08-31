//
//  TripsFunctions.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/10/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import Foundation
class TripFunctions{
    
    static func  creatTrip(tripModel : TripModel){
        
    }
    static func readTrips(){
       
        if Data.tripModels.count == 0{
            Data.tripModels.append(TripModel(title:"Trip to Bali!"))
            Data.tripModels.append(TripModel(title:"Mexico"))
            Data.tripModels.append(TripModel(title:"Russian Trip"))
            
            
        }
        
    }
    static func updateTrip(tripModel : TripModel){
        
    }
    static func deleteTrip(tripModel : TripModel){
        
    }
}
