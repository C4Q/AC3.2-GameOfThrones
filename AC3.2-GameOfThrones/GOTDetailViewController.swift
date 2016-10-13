//
//  GOTDetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Kareem James on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {

    @IBOutlet weak var episodeTitle: UILabel!
    
    var detailGOTData: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let details = detailGOTData {
            episodeTitle.text = details.name
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
