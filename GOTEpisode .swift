//
//  GOTEpisode .swift
//  AC3.2-GameOfThrones
//
//  Created by Thinley Dorjee on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let summary: String
    
    let season: Int
    let link: String


//    "name": "Winter is Coming",
//    "airdate": "2011-04-17",
    
    //    "season": 1,
    //    "runtime": 60,
    //    "href"
    
    //    "number": 1,
 
    
//    "airstamp": "2011-04-17T21:00:00-04:00",
//    "airtime": "21:00",
//    "id": 4952,
//    image

    
    ///IMAGE STUFFS
    
//    let image: UIImage?
//    let data: Data?
//
//    
//    //1. Create a url from the string of the url
//    let url = URL.init(string: "website.gov")
//    
//    //2. Create a data object out of the url
//    if let unwrappedURL = url {
//        data = try? Data.init(contentsOf: unwrappedURL)
//    }
//    
//    //3. Create an image out of the data object created
//    if let realData = data {
//        image = UIImage(data: realData)
//    }
    
    
//    let url = URL.init(string: )
    
    
    init(name: String, number: Int, airdate: String, summary: String, season: Int, link: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.summary = summary
        self.season = season
        self.link = link
        
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let summary = dict["summary"] as? String,
            let season = dict["season"] as? Int,
            let link = dict["url"] as? String{
            self.init(name: name, number: number, airdate: airdate, summary: summary, season: season, link: link)
         
        }
            
        else {
            return nil
        }
    }
}
