//
//  ActivityTableViewCell.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/25/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var activityView: UIView!
    
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activitySubtitle: UILabel!
//    static let identifier = String(describing: ActivityTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        activityView.addShadowAndRoundedCorners()
        activityTitle.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17)
        activitySubtitle.font = UIFont(name: Theme.bodyFontName, size: 17)
    }

    func settup(model : ActivityModel){
        
        activityTitle.text = model.title
        activitySubtitle.text = model.subTitle
        activityImageView.image = activityImage(type: model.activityType)
    }
    
    func activityImage(type: ActivityType)->UIImage{
        
        switch type {
        
        case .auto:
            return #imageLiteral(resourceName: "auto")
        case .excursion:
            return #imageLiteral(resourceName: "excursion")
        case .flight:
            return #imageLiteral(resourceName: "flight")
        case .food:
            return #imageLiteral(resourceName: "food")
        case .hotel:
            return #imageLiteral(resourceName: "hotel")
        }
    }

}
