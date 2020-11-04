//
//  CastTableViewController.swift
//  IRDB_JMR
//
//  Created by Justin Raitz on 10/29/20.
//

import UIKit

class PicksTableViewController: UITableViewController {
    
    var pickListArray: [Picks]?
    var detailItem: Teams?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Draft Picks"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pickListArray?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = pickListArray?[indexPath.row].playerName

        cell.detailTextLabel?.text = pickListArray?[indexPath.row].pickNum
        
        return cell
    }

}
