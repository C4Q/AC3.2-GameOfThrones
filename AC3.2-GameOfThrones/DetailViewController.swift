//
//  DetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Edward Anchundia on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var epsiodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeRunTime: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeSummary: UILabel!
    
    var episodeDetail: GOTEpisode!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        episodeName.text = episodeDetail.name
        episodeNumber.text = "Episode \(String(episodeDetail.number))"
        episodeRunTime.text = "\(String(episodeDetail.runTime)) Minutes"
        episodeSeason.text = "Season \(String(episodeDetail.season))"
        episodeSummary.text = episodeDetail.summary
        
        
        
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
