//
//  AddTripViewController.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/14/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    
    @IBOutlet weak var popUpView: UIView!
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tripTextField: UITextField!
   
    
    
    @IBOutlet weak var Cancel: AppUIButton!
    
    @IBOutlet weak var Save: AppUIButton!
    
    var donesaving :(()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // designing the popUpView
        popUpView.backgroundColor = Theme.background
        popUpView.addShadowAndRoundedCorners()
        
        // designing the titleLabel
        titleLabel.font = UIFont(name: Theme.mainFontName ,size:24)
    }
    
// TODO: does it make a diffrence if we have set sender to AppUIButton
//    which one is correct?
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        TripFunctions.creatTrip(tripModel: TripModel(title: tripTextField.text!))
        
        if let donesaving = donesaving{
            donesaving()
        }
        
        
        dismiss(animated: true)
        }
 }
    
