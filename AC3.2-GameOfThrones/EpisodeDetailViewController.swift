//
//  EpisodeDetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Sabrina Ip on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var seasonAndEpisodeNumberLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var thisGOTEpisode = GOTEpisode(name: "", number: 0, airdate: "", season: 0, summary: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        episodeNameLabel.text = thisGOTEpisode.name
        seasonAndEpisodeNumberLabel.text = "Season \(thisGOTEpisode.season), episode \(thisGOTEpisode.number)"
        airdateLabel.text = thisGOTEpisode.airdate
        summaryLabel.text = thisGOTEpisode.summary
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
