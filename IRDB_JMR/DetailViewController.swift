//
//  ViewController.swift
//  IRDB_JMR
//
//  Created by Justin Raitz on 10/20/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var prevRecordLabel: UILabel!
    @IBOutlet var prevFinishLabel: UILabel!
    @IBOutlet var ownerLabel: UILabel!
    @IBOutlet var draftSpotLabel: UILabel!
    @IBOutlet var draftGradeLabel: UILabel!
    @IBOutlet var projFinishLabel: UILabel!
    @IBOutlet weak var draftSummaryTextView: UITextView!
    
    var detailItem: Teams? {
        didSet {
            // Update the view
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = detailItem?.teamName
        
        let nav = self.navigationController?.navigationBar
          
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)]
        
        configureView()
    }

    func configureView() {
        
        if let teams = detailItem {
            // Header View
            
            // Image from URL
            if let thisLogoImage = logoImage {
                // DO STUFF
                let url = URL(string: teams.logoURL)
                let data = try? Data(contentsOf: url!)
                thisLogoImage.image = UIImage(data: data!)
            }
            // Title Label
            if let thisTeamNameLabel = teamNameLabel {
                thisTeamNameLabel.text = teams.teamName
            }
            // Year Label
            if let thisPrevRecordLabel = prevRecordLabel {
                thisPrevRecordLabel.text = "2019 Record: \(teams.prevYrRecord)"
            }
            // Year Label
            if let thisPrevFinishLabel = prevFinishLabel {
                thisPrevFinishLabel.text = "2019 Place: \(teams.prevYrFinish)"
            }
            // Format of Production Label
            if let thisOwnerLabel = ownerLabel {
                thisOwnerLabel.text = "Owner: \(teams.owner)"
            }
            // Episodes Label
            if let thisDraftSpotLabel = draftSpotLabel {
                thisDraftSpotLabel.text = "Pick Number: \(teams.draftSpot)"
            }
            // Studio Label
            if let thisDraftGradeLabel = draftGradeLabel {
                thisDraftGradeLabel.text = "Draft Grade: \(teams.draftGrade)"
            }
            // Description Label
            if let thisProjFinishLabel = projFinishLabel {
                thisProjFinishLabel.text = "2020 Projected: \(teams.projFinish)"
            }
            
            // Bottom View
            // Summary Text
            if let thisDraftSummaryTextView = draftSummaryTextView {
                thisDraftSummaryTextView.text = "Draft Summary:\n\(teams.draftSummary)"
            }
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showPicksList" {
            
            let controller = segue.destination as! PicksTableViewController
            controller.pickListArray = detailItem?.picks
        }
    }
}
