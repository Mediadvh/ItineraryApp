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
   
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        popUpView.backgroundColor = Theme.background
        popUpView.addShadowAndRoundedCorners()
        
        
    }
    

    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        dismiss(animated: true)
        }
            }
    
