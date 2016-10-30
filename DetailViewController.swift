//
//  DetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Amber Spadafora on 10/28/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var airdate: UILabel!
    @IBOutlet weak var episodeNum: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    var episode: GOTEpisode?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTitle.text = episode?.name
        
        if let ep = episode {
            episodeTitle.text = ep.name
            airdate.text = ep.airdate
            episodeNum.text = "Episode \(ep.number)"
            var summaryText = ep.summary
            
            if summaryText.contains("<p>"){
                summaryText = summaryText.replacingOccurrences(of: "<p>", with: "")
            }
            
            if summaryText.contains("</p>") {
                summary.text = summaryText.replacingOccurrences(of: "</p>", with: "")
            }
            
            if let imageURL = URL(string: ep.imageUrlString) {
                if let imageData = NSData(contentsOf: imageURL) {
                    image.image = UIImage(data: imageData as Data)
                }
            }
        }
      
        
        
        
        

        // Do any additional setup after loading the view.
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
