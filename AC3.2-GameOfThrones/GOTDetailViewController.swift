//
//  GOTDetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Ilmira Estil on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {
    
    var stupidEpisode: GOTEpisode?
    var data: Data?
    
 
   
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var epTitle: UILabel!
    @IBOutlet weak var summary: UITextField!
    
    func randomColor() -> CGFloat {
        return CGFloat(arc4random_uniform(10))/10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        epTitle.text = stupidEpisode?.name
        summary.text = stupidEpisode?.summary
        if let urlString = stupidEpisode?.url,
            let website = URL(string: urlString),
            let unwrappedURL = try? Data.init(contentsOf: website)
        {
           image.image = UIImage(data: unwrappedURL)
        }
        
      
        
        
        let red = randomColor()
        let blue = randomColor()
        let green = randomColor()
        
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
    }
 
    

}
