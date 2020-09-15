//
//  DayModel.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/23/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import Foundation
struct DayModel{
    
    var id :UUID!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, data:[ActivityModel]?){
        id = UUID()
        self.title = title
        self.subtitle = subtitle
        
        if let data = data{
            self.activityModels = data
        }
    }
    
}
