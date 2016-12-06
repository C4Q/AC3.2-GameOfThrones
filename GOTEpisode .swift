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
    
    let image: String
    
    let season: Int
    let link: String
    
    
    init(name: String, number: Int, airdate: String, summary: String, image: String, season: Int, link: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.summary = summary
        self.image = image
        self.season = season
        self.link = link
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let summary = dict["summary"] as? String,
            
            let imageDict = dict["image"] as? [String: String],
            let image = imageDict["medium"],
            
            let season = dict["season"] as? Int,
            let link = dict["url"] as? String{
            self.init(name: name, number: number, airdate: airdate, summary: summary, image: image, season: season, link: link)
         
        }
            
        else {
            return nil
        }
    }
}
