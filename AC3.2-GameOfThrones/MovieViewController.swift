//
//  MovieViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Annie Tung on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var airdate: UILabel!
    @IBOutlet weak var summary: UILabel!
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ep = episode {
            name.text = ep.name
            number.text = String("Episode number: \(ep.number)")
            airdate.text = ep.airdate
            summary.text = ep.summary
            if let imageURL = URL(string: ep.imageUrlString) {
                if let imageData = NSData(contentsOf: imageURL) {
                    imageView.image = UIImage(data: imageData as Data)
                }
            }
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
