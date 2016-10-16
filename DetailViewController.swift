//
//  DetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Madushani Lekam Wasam Liyanage on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var episodeOfGOT: GOTEpisode?
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = episodeOfGOT?.name
        summaryLabel.text = episodeOfGOT?.summary
        
        if let urlString = episodeOfGOT?.imageURL, let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            episodeImage.image = UIImage(data: data)
        }
        view.backgroundColor = changeBackgroundColor()
       
    }
    
    func randomNum() -> Double {
        return Double(arc4random_uniform(10))/10
    }
    func changeBackgroundColor() -> UIColor {
        
        let redColor = randomNum()
        let greenColor = randomNum()
        let blueColor = randomNum()
        
       return UIColor(red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: 1.0)
    
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
