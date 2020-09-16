//
//  AddDayViewController.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/26/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class AddDayViewController: UIViewController {

   
      @IBOutlet weak var popUpView: UIView!
      
      @IBOutlet weak var titleLabel: UILabel!
      
      @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
      
      @IBOutlet weak var Cancel: AppUIButton!
      
      @IBOutlet weak var Save: AppUIButton!
      
      
      
      var donesaving :(()->())?
      var indexToEdit:Int?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          // Do any additional setup after loading the view.
          
          // designing the popUpView
          popUpView.backgroundColor = Theme.background
          popUpView.addShadowAndRoundedCorners()
          
          // designing the titleLabel
          titleLabel.font = UIFont(name: Theme.mainFontName ,size:24)
          
          
          
          
          if let index = indexToEdit {
              let trip = Data.tripModels[index]
              titleTextField.text = trip.title
              
              titleLabel.text = "Edit Trip"
          }
      }
      
      // TODO: does it make a diffrence if we have set sender to AppUIButton
      //    which one is correct?
      
      @IBAction func cancel(_ sender: UIButton) {
          dismiss(animated: true)
      }
      
      @IBAction func save(_ sender: UIButton) {
          
          titleTextField.rightViewMode = .never
        guard titleTextField.hasValue, let newTitle = titleTextField.text else {
              return
          }
          
//          if let index = indexToEdit{
//              TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
//          }
//          else{
//              TripFunctions.creatTrip(tripModel: TripModel(title: newTripName,image: imageView.image))
//
//          }
//
//          if let donesaving = donesaving{
//              donesaving()
//          }

          dismiss(animated: true)
          
      }
      
}
