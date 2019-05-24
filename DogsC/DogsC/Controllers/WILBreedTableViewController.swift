//
//  WILBreedTableViewController.swift
//  DogsC
//
//  Created by William Moody on 5/22/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class WILBreedTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        WILDogController.shared().fetchDog { (true) in
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return WILDogController.shared().dog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath)
        
        let dog = WILDogController.shared().dog[indexPath.row]
        
        cell.textLabel?.text = dog.self as? String
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toImage", let indexPath = tableView.indexPathForSelectedRow{
            let dogSearch = WILDogController.shared().dog[indexPath.row]
            let destinationVC = segue.destination as? WILImageTableViewController
            destinationVC?.dogToSearch = dogSearch as? String
        }
    }
}
