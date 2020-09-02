//
//  TripsViewController.swift
//  ItineraryApp
//
//  Created by Media Davarkhah on 6/12/1399 AP.
//  Copyright © 1399 Media Davarkhah. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        TripFunctions.readTrips(completion: { [weak self] in
            // completion
            // once we have all the data the completion parameter which is a function gets called in the class TripFunctions
            self?.tableView.reloadData()
            
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
        cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        
        cell!.textLabel?.text = Data.tripModels[indexPath.row].title

        return cell!
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
