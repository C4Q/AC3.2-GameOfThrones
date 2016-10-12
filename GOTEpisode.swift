//
//  GOTEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Harichandan Singh on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let season: Int
    let summary: String
    let url: String
    let airdate: String
    
    init(name: String, number: Int, season: Int, summary: String, url: String, airdate: String) {
        self.name = name
        self.number = number
        self.season = season
        self.summary = summary
        self.url = url
        self.airdate = airdate
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let season = dict["season"] as? Int,
            let summary = dict["summary"] as? String,
            let url = dict["url"] as? String,
            let airdate = dict["airdate"] as? String {
            self.init(name: name, number: number, season: season, summary: summary, url: url, airdate: airdate)
        }
        else {
            return nil
        }
    }
}
