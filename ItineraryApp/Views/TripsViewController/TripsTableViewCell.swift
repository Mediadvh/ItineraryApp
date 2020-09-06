//
//  TripsTableViewCell.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/13/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tripImageView: UIImageView!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // the code that we wanna happen first when the cell is created
        // Initialization code
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.backgroundColor = Theme.accent
        
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
        
    }
    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        tripImageView.image = tripModel.image
    }

    
    
   

}
