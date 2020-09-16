//
//  TripActivitiesViewController.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/23/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class TripActivitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var background: UIImageView!
    var tripTitle = ""
    var tripModel: TripModel?
    var tripId : UUID!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1: this way is faster
        title = tripTitle
        tableView.dataSource = self
        tableView.delegate = self
        // there's a case where the user might tap on the trip so we move to the activity view controller but before it loads the trip the user taps back so the self would be nil and app would crash
        // to avoid that we use [weak self] which basically makes the self optional
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
           // if self is nil return if it's not make it a strong var(?not sure?)
            guard let self = self else {return}
            self.tripModel = model
            
            guard let model = model else {return}
            self.background.image = model.image
            // 2: this way would take longer
            //self.title = model.title
            self.tableView.reloadData()
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
//    @IBAction func back(_ sender: UIButton) {
//
//        navigationController?.popViewController(animated: true)
//        //dismiss(animated: true)
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addAction(_ sender: AppUIButton) {
        
        
        func handleAddDay(type: UIAlertAction){
            
//            let storyboard = UIStoryboard(name: String(describing: AddDayViewController.self), bundle: nil)
//            let vc = storyboard.instantiateInitialViewController()!
            let vc = AddDayViewController.getInstance()
            present(vc, animated: true)
            
            
            
        }
        
        let alert = UIAlertController(title: "New Item", message: "What would you like to add?", preferredStyle: .actionSheet)
        let day = UIAlertAction(title: "Day", style: .default, handler: handleAddDay)
        let activity = UIAlertAction(title: "Activity", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        // alert.view.tintColor = Theme.tint
        alert.addAction(cancel)
        alert.addAction(day)
        alert.addAction(activity)
        //video 30:we have to tell it where the user tapped for ipad
        alert.popoverPresentationController?.sourceView = sender
        //alert.popoverPresentationController?.sourceRect = sender.bounds
        // we could also use the iboutlet for button instead of sender 
        self.present(alert,animated: true)

        

        
        
    }
    
    
}
extension TripActivitiesViewController: UITableViewDataSource,UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.days.count ?? 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
        
        cell.setup(model: (tripModel?.days[section])!)
        
        return cell.contentView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier)
        return cell?.bounds.height ?? 44
        
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        let title = tripModel?.days[section].title ?? ""
//        let subtitle = tripModel?.days[section].subtitle ?? ""
//        return "\(title) - \(subtitle)"
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.days[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier) as! ActivityTableViewCell
        let model = tripModel?.days[indexPath.section].activityModels[indexPath.row]
       
        cell.settup(model: model!)
        
        
        return cell
    }
    
    
    
}
