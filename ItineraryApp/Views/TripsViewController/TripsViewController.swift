//
//  TripsViewController.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/12/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController{

   
    
    @IBOutlet var helpView: UIVisualEffectView!
    
    @IBOutlet weak var addButton: FloatingActionButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    static var image : UIImage?
    var seenHelpView = "seenHelpView"
    var indexToEdit:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // telling the table view to use our code
        tableView.dataSource = self
        tableView.delegate = self
        // unowned : we know that it exists for sure
        TripFunctions.readTrips(completion: { [unowned self] in
            // completion
            // once we have all the data the completion parameter which is a function gets called in the class TripFunctions
            self.tableView.reloadData()
            if Data.tripModels.count > 0{
                if UserDefaults.standard.bool(forKey: self.seenHelpView) == false {
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.frame
                  }
                
            }
            
        })
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue"
        {
            let popup = segue.destination as! AddTripViewController
            popup.indexToEdit = self.indexToEdit
            popup.donesaving = {[weak self] in
                self?.tableView.reloadData()
            }
            indexToEdit = nil
        }
    }
    
    @IBAction func closeVisualEffect(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.helpView.alpha = 0
        }) { (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenHelpView)
            self.helpView.alpha = 1
        }
    }
    
    @IBAction func showHelp(_ sender: UIButton) {
        
        
    view.addSubview(helpView)
    helpView.frame = view.frame
   
    
    }
    
    
    
}



// you can also put this extension into a seperate file

extension TripsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.identifier) as! TripsTableViewCell
        
       
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "delete") { (contextualAction, view ,actionPerformed : @escaping (Bool) -> Void) in
            // this is where we should perform the delete action
            
            
            // show an action alert
            let trip = Data.tripModels[indexPath.row]
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete trip?:\(trip.title)", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (alertAction) in
               
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                actionPerformed(true)
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ (alertAction) in
                actionPerformed(false)            }
            
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)

            
            self.present(alert,animated: true)
            
            
            
            
            }
        delete.image = #imageLiteral(resourceName: "delete")
           
        
        
        return UISwipeActionsConfiguration(actions: [delete])
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "edit") { (contextualAction, view, actionPerformed : @escaping (Bool) -> Void) in
            // perform edit
            self.indexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            
            
            actionPerformed(true)
            
           
        }
        edit.image = UIImage(named: "edit")
        edit.backgroundColor = Theme.edit
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // String(describing: TripActivitiesViewController.self) its a way of making sure we got the right one and we didn't misspell anything
        let trip = Data.tripModels[indexPath.row]
        
        let storyboard = UIStoryboard(name: String(describing: TripActivitiesViewController.self), bundle: nil)
        
        let vc  = storyboard.instantiateInitialViewController() as! TripActivitiesViewController
        navigationController?.pushViewController(vc, animated: true)
        
        vc.tripId = trip.id
        vc.tripTitle = trip.title
        
        
        // TODO: figure out why it is nil
//        var tripImage = trip.image
//        if let tripImage = tripImage{
//            vc.activityImage.image = tripImage
//        }
        
        // every viewcontroller already has a navigationController
        // since it's optional it is nil by default
        
        
       
        //self.present(vc, animated: true, completion: nil)
    }
}
