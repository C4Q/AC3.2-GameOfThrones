//
//  episodes.swift
//  AC3.2-GameOfThrones
//
//  Created by Edward Anchundia on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let runTime: Int
    let season: Int
    let summary: String
    let image: String
    
    init(name: String, number: Int, airdate: String, runTime: Int, season: Int, summary: String, image: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.runTime = runTime
        self.season = season
        self.summary = summary
        self.image = image
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let runTime = dict["runtime"] as? Int,
            let season = dict["season"] as? Int,
            let summary = dict["summary"] as? String,
            let image = dict["url"] as? String{
            self.init(name: name, number: number, airdate: airdate, runTime: runTime, season: season, summary: summary, image: image)
        }
        else {
            return nil
        }
    }
}
