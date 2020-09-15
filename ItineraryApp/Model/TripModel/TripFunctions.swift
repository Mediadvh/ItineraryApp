//
//  TripsFunctions.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/10/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit
class TripFunctions{
    
    static func  creatTrip(tripModel : TripModel){
       
        Data.tripModels.append(tripModel)
        
    }
    static func readTrips(completion: @escaping() -> ()){
        DispatchQueue.global(qos :.userInteractive).async {
            
            // replace with real data store code
            if Data.tripModels.count == 0{
                Data.tripModels.append(TripModel(title:"Trip to New York!"))
                Data.tripModels.append(TripModel(title:"Mexico"))
                Data.tripModels.append(TripModel(title:"Russian Trip"))
                Data.tripModels[0].days.append(DayModel(title: "november 12", subtitle: "boarding", data: nil))
                 Data.tripModels[0].days.append(DayModel(title: "november 13", subtitle: "visiting Empire state", data: nil))
                Data.tripModels[0].days[0].activityModels.append(ActivityModel(title: "hotel", subTitle: "rest", activityType: .hotel))
                Data.tripModels[0].days[1].activityModels.append(ActivityModel(title: "visiting Empire State", subTitle: "8:00 - 11:00", activityType: .excursion))
                Data.tripModels[0].image = #imageLiteral(resourceName: "nyc")
            }
            DispatchQueue.main.async {
                completion()
            }
        }
        
        
    }
    
    static func readTrip(by id:UUID,completion: @escaping (TripModel?)->()){
          // replace with real data store code
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripModels.first(where: { $0.id == id})
            
            DispatchQueue.main.async {
                completion(trip)
            }
        }
        
        
        
    }
    static func updateTrip(at index: Int,title: String ,image:UIImage? = nil)
    {
        
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
        
        
    }
    static func deleteTrip(index : Int){
        
        Data.tripModels.remove(at: index)
        
    }
}
