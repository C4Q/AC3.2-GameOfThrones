//
//  DetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Thinley Dorjee on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var number: UILabel!
    
    var detailMovie: GOTEpisode?
    @IBAction func link(_ sender: UIButton) {
        if let url = NSURL(string: (detailMovie?.link)!){
        UIApplication.shared.openURL(url as URL)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeImage.image = UIImage(named: "GOT@2X.jpeg")
        
        if let realSeason = detailMovie?.season{
            season.text = "Season: \(String(realSeason))"
        }
        
        if let realNumber = detailMovie?.number{
            number.text = "Number: \(String(realNumber))"
        }
        
        
        if let thisGOTEpisode = detailMovie?.summary{
            let  str = thisGOTEpisode.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            summaryLabel.text = str

        }
        summaryLabel.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }

 

}
