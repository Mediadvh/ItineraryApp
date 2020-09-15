    //
    //  AddTripViewController.swift
    //  ItineraryApp
    //
    //  Created by Media Davarkhah on 6/14/1399 AP.
    //  Copyright © 1399 Media Davarkhah. All rights reserved.
    //
    
    import UIKit
    import Photos
    
    class AddTripViewController: UIViewController {
        
        
        @IBOutlet weak var popUpView: UIView!
        
        @IBOutlet weak var titleLabel: UILabel!
        
        @IBOutlet weak var tripTextField: UITextField!
        
        @IBOutlet weak var Cancel: AppUIButton!
        
        @IBOutlet weak var Save: AppUIButton!
        
        @IBOutlet weak var imageView: UIImageView!
        
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
            imageView.layer.cornerRadius = 10
            
            titleLabel.layer.shadowOpacity = 1
            titleLabel.layer.shadowOffset = CGSize.zero
            titleLabel.layer.shadowColor = UIColor.white.cgColor
            titleLabel.layer.shadowRadius = 5
            
            if let index = indexToEdit {
                let trip = Data.tripModels[index]
                tripTextField.text = trip.title
                imageView.image = trip.image
                titleLabel.text = "Edit Trip"
            }
        }
        
        // TODO: does it make a diffrence if we have set sender to AppUIButton
        //    which one is correct?
        
        @IBAction func cancel(_ sender: UIButton) {
            dismiss(animated: true)
        }
        
        @IBAction func save(_ sender: UIButton) {
            
            tripTextField.rightViewMode = .never
            guard tripTextField.text != "", let newTripName = tripTextField.text else {
                
                // TODO: why doesn't the view get set to the correct size
                //            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
                //            imageView.image = UIImage(named: "warningBlack")
                //            imageView.contentMode = .scaleAspectFit
                //
                //            tripTextField.rightView = imageView
                //
                //            tripTextField.rightViewMode = .always
                
                // Alternatives
                
                //tripTextField.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
                
                tripTextField.layer.borderColor = UIColor.red.cgColor
                tripTextField.layer.borderWidth = 1
                tripTextField.layer.cornerRadius = 5
                
                tripTextField.placeholder = "Invalid Input / Try Again"
                return
            }
            
            if let index = indexToEdit{
                TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
            }
            else{
                TripFunctions.creatTrip(tripModel: TripModel(title: newTripName,image: imageView.image))
                
            }

            if let donesaving = donesaving{
                donesaving()
            }

            dismiss(animated: true)
            
        }
        
        fileprivate func presentPhotoPickerController() {
            DispatchQueue.main.async {
                
            let myPickerController = UIImagePickerController()
            myPickerController.allowsEditing = true
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            
            
            
            self.present(myPickerController, animated: true)
                
            }
        }
        
        @IBAction func addPhoto(_ sender: UIButton) {
            
            
                DispatchQueue.main.async {
                    PHPhotoLibrary.requestAuthorization { (status) in
                        switch status{
                        case .authorized:
                            self.presentPhotoPickerController()
                            
                        case .notDetermined:
                            if status == .authorized {
                                self.presentPhotoPickerController()                        }
                        
                        case .restricted:
                            let alert = UIAlertController(title: "Photo Library Resticted ", message: "Photo Library access is restricted and cannot be accessed" , preferredStyle: .alert )
                            
                            let okAction = UIAlertAction(title: "ok", style: .default)
                            
                            alert.addAction(okAction)
                            
                            self.present(alert,animated: true)
                        
                        case .denied:
                            let alert = UIAlertController(title: "Photo Library Denied ", message: "Photo Library access was previously denied. please Update your  setting if you wish to change this. " , preferredStyle: .alert )
                            
                            let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default){(action) in
                                // has to be in main thread
                                DispatchQueue.main.async {
                                    
                                    let url = URL(string: UIApplication.openSettingsURLString)!
                                    UIApplication.shared.open(url,options: [:])
                                }
                                
                                
                            }// goToSettingsAction
                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                            
                            alert.addAction(goToSettingsAction)
                            alert.addAction(cancelAction)
                            DispatchQueue.main.async {
                                 self.present(alert,animated: true)
                            }
                           
                            //                        alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
                            
                        } // switch
                    }
                    
                }// PHPhotoLibrary.requestAuthorization
                
                
                
            } // if statement
        } // end of addPhoto function
        
        
        
        
    
    
    extension AddTripViewController:UIImagePickerControllerDelegate , UINavigationControllerDelegate{
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                
                self.imageView.image = image
            }
            else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                
                self.imageView.image = image
            }
            
            presentedViewController?.dismiss(animated: true)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true)
        }
    }
