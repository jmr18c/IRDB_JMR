//
//  CastTableViewController.swift
//  IRDB_JMR
//
//  Created by Justin Raitz on 10/29/20.
//

import UIKit

class CastTableViewController: UITableViewController {
    
    var castListArray: [Cast]?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return castListArray?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        
        
        // Configure the cell...
        cell.textLabel?.text = castListArray?[indexPath.row].actorName

        cell.detailTextLabel?.text = "AS: " + (castListArray?[indexPath.row].role)!
        
        return cell
    }

}
