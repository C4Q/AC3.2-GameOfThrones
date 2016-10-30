//
//  GOTEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Amber Spadafora on 10/27/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let season: Int
    let summary: String
    let imageUrlString: String
    
    init(name: String, number: Int, airdate: String, season: Int, summary: String, image: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.season = season
        self.summary = summary
        self.imageUrlString = image
    }
    
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let season = dict["season"] as? Int,
            let summary = dict["summary"] as? String,
            let image = dict["image"] as? [String: String] {
            guard let mediumImageURL = image["medium"] else { return nil }
            
            self.init(name: name, number: number, airdate: airdate, season: season, summary: summary, image: mediumImageURL)
        }
        else {
            return nil
        }
    }
}
