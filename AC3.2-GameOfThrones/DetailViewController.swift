//
//  DetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Harichandan Singh on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var episode: GOTEpisode?
    
    
    //MARK: - Outlets
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }

    func setUpData() {
        if let x = self.episode {
            episodeTitleLabel.text = x.name
            seasonNumberLabel.text = "Season \(x.season): Episode \(x.number) (Airdate: \(x.airdate))"
            summaryTextView.text = x.summary
            
        }
    }
    
    //MARK: - Actions
    @IBAction func episodeLinkButtonTapped(_ sender: UIButton) {
        if let urlString = episode?.url {
            let url = URL(string: urlString)
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
