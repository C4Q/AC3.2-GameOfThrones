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
        seasonAndEpisodeNumberLabel.text = "Season \(thisGOTEpisode.season), Episode \(thisGOTEpisode.number)"
        airdateLabel.text = thisGOTEpisode.airdate
        summaryLabel.text = thisGOTEpisode.summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
