//
//  TripsViewController.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/12/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController{

   
    @IBOutlet weak var addButton: FloatingActionButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // telling the table view to use our code
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips(completion: { [weak self] in
            // completion
            // once we have all the data the completion parameter which is a function gets called in the class TripFunctions
            self?.tableView.reloadData()
            
        })
        view.backgroundColor = Theme.background
        
        
        
        
        
    }
}
// you can also put this extension into a seperate file
extension TripsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        
       
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
