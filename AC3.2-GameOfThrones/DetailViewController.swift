//
//  DetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Marcel Chaucer on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var  detailEpisode: GOTEpisode?
    
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    if let detail = detailEpisode {
       self.title = detail.name
       self.episodeTitle.text = detail.name
        
        let url = URL(string: detail.originalImage)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
       episodeImage.image = UIImage(data: data!)
        }
    }
    @IBAction func goToWebsite(_ sender: UIButton) {
        guard let url = URL(string:(detailEpisode!.url)) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
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
