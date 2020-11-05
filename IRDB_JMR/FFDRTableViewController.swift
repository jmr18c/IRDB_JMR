//
//  IRDBTableViewController.swift
//  IRDB_JMR
//
//  Created by Justin Raitz on 10/20/20.
//

import UIKit

class FFDRTableViewController: UITableViewController {

    var draftModel: DraftDataModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var dataController = DataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        title = "FFDR"
        
        // 1
        let nav = self.navigationController?.navigationBar
          
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 36/255, green: 178/255, blue: 75/255, alpha: 1)
          
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        imageView.contentMode = .scaleAspectFit
              
        // 4
        let image = UIImage(named: "espn_fantasy_football")
        imageView.image = image
              
        // 5
        navigationItem.titleView = imageView
        
        // Call dataController and then wait
        dataController.getJSONData(completion: {dataModel in
            self.draftModel = dataModel
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return draftModel?.draftRecap.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return draftModel?.draftRecap[section].teamEntries.count ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return draftModel?.draftRecap[section].header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)

        
        
        // Configure the cell...
        cell.textLabel?.text = draftModel?.draftRecap[indexPath.section].teamEntries[indexPath.row].teamName

        cell.detailTextLabel?.text = "\(String(draftModel?.draftRecap[indexPath.section].teamEntries[indexPath.row].draftSpot ?? 0))"
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDraftDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedObject = draftModel!.draftRecap[indexPath.section].teamEntries[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.detailItem = selectedObject
            }
        }
    }
}
