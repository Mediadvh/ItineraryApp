//
//  ActivityModel.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/23/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit
struct ActivityModel {
    
    var id : UUID!
    var title = ""
    var subTitle = ""
    var activityType: ActivityType
    var photo : UIImage?
    
    init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil){
        
        id = UUID()
        self.title = title
        self.subTitle = subTitle
        self.activityType = activityType
        self.photo = photo
    }
    
    
}
