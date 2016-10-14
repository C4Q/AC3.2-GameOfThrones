//
//  GOTEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Marcel Chaucer on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let season: Int
    let originalImage: String
    let url: String
    
    init(name: String, number: Int, airdate: String, season: Int, originalImage: String, url: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.season = season
        self.originalImage = originalImage
        self.url = url
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let season = dict["season"] as? Int,
            let image = dict["image"] as? [String: Any],
            let originalImage = image["original"] as? String,
            let url = dict["url"] as? String
        {
            self.init(name: name, number: number, airdate: airdate, season: season, originalImage: originalImage, url: url)
        }
        else {
            return nil
        }
    }
}
