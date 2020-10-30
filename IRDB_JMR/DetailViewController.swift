//
//  ViewController.swift
//  IRDB_JMR
//
//  Created by Justin Raitz on 10/20/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var formatLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var studioLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var detailItem: Entry? {
        didSet {
            // Update the view
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = detailItem?.name
        
        let nav = self.navigationController?.navigationBar
          
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)]
        
        configureView()
    }

    func configureView() {
        
        if let entry = detailItem {
            // Header View
            
            // Image from URL
            if let thisMediaImage = mediaImage {
                // DO STUFF
                let url = URL(string: entry.imageURL)
                let data = try? Data(contentsOf: url!)
                thisMediaImage.image = UIImage(data: data!)
            }
            // Title Label
            if let thisTitleLabel = titleLabel {
                thisTitleLabel.text = entry.name
            }
            // Year Label
            if let thisYearLabel = yearLabel {
                thisYearLabel.text = entry.yearStart
                // If it has an end year add it to the end
                if entry.yearEnd != nil {
                    if entry.yearEnd == " - " {
                        thisYearLabel.text! += "-Present"
                    } else {
                        thisYearLabel.text! += "-\(entry.yearEnd ?? "")"
                    }
                }
            }
            // Format of Production Label
            if let thisFormatLabel = formatLabel {
                thisFormatLabel.text = entry.format
            }
            // Episodes Label
            if let thisEpisodeLabel = episodeLabel {
                if let episodeCount = entry.episodes {
                    // IF there is only 1 episode take that "s" off
                    if entry.episodes! == 1 {
                        thisEpisodeLabel.text = "\(episodeCount) Episode"
                    } else {
                        thisEpisodeLabel.text = "\(episodeCount) Episodes"
                    }
                } else {
                    thisEpisodeLabel.text = ""
                }
            }
            // Studio Label
            if let thisStudioLabel = studioLabel {
                thisStudioLabel.text = entry.studio
            }
            
            // Bottom View
            
            // Description Label
            if let thisDescriptionLabel = descriptionLabel {
                thisDescriptionLabel.text = entry.description
            }
            // Summary Text
            if let thisSummaryTextView = summaryTextView {
                thisSummaryTextView.text = entry.summary
            }
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCastList" {
            
            let controller = segue.destination as! CastTableViewController
            controller.castListArray = detailItem?.starring
        }
    }
}
