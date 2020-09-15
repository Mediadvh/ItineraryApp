//
//  TripActivitiesTableViewCell.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/24/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
//    static let identifier = String(describing: HeaderTableViewCell.self)
//    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        title.font = UIFont(name: Theme.bodyFontName, size: 17)
        subtitle.font = UIFont(name: Theme.bodyFontNameBold , size: 15)
    }

    

    func setup(model : DayModel){
        
        title.text = model.title
        subtitle.text = model.subtitle
        
    }
}
