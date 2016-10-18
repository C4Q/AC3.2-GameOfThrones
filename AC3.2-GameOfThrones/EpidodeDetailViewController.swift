//
//  EpidodeDetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Cris on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class EpidodeDetailViewController: UIViewController {
    
    @IBOutlet weak var seasonImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeSummary: UILabel!
    
    
    var episodeSelected: GOTEpisode?
    
    var image: UIImageView?
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = episodeSelected?.name, let number = episodeSelected?.number, let runtime = episodeSelected?.runtime, let season = episodeSelected?.season, let summary = episodeSelected?.summary{
        episodeName.text = name
        episodeNumber.text = "Episode: \(number)"
        episodeRuntime.text = "Runtime: \(runtime)"
        episodeSeason.text = "Season: \(season)"
            
            var newSummary = summary.components(separatedBy:  " ")
            let newArrayCount = newSummary.count
            
            for _ in 1...3 {
                newSummary[0].characters.removeFirst()
            }
            for _ in 1...4 {
                newSummary[newArrayCount - 1].characters.removeLast()
            }
            
            let newSummaryString = newSummary.joined(separator: " ")
            
            episodeSummary.text = newSummaryString
            
        }
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
