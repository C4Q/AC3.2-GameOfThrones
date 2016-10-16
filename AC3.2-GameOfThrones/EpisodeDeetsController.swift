//
//  EpisodeDeetsController.swift
//  AC3.2-GameOfThrones
//
//  Created by Marty Avedon on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class EpisodeDeetsController: UIViewController {
    
    var chosenEpisode: GOTEpisode?
    
    // i want the background to be the image associated with the episode selected, with a box over it that is slightly opaque white. the box will contain the title in bold italics. below the title will be episode details. swiping right will show just the image.
    
    // i need an image view? a table cell stacked over it, and a gestures thingy

    override func viewDidLoad() {
        super.viewDidLoad()

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
