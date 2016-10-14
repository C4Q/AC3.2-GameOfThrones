//
//  GameOfThronesEpisodes.swift
//  AC3.2-GameOfThrones
//
//  Created by Annie Tung on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let imageUrlString: String
    let season: Int
    let summary: String
    
    init(name: String, number: Int, airdate: String, image: String, season: Int, summary: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.imageUrlString = image
        self.season = season
        self.summary = summary
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let season = dict["season"] as? Int,
            let summary = dict["summary"] as? String,
            let image = dict["image"] as? [String: String] {
            guard let mediumImageURL = image["medium"] else { return nil }
            
            self.init(name: name, number: number, airdate: airdate, image: mediumImageURL, season: season, summary: summary)
        }
        else {
            return nil
        }
    }
}
