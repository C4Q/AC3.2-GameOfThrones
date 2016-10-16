//
//  GOTEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Marty Avedon on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

// Guess who's been studying protocols? This is a very trivial example

protocol Episode {
    var name: String {get}
    var number: Int {get}
    var airdate: String {get}
}

class GOTEpisode: Episode {
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let summary: String
    
    init(name: String, season: Int, number: Int, airdate: String, summary: String) {
        self.name = name
        self.season = season
        self.number = number
        self.airdate = airdate
        self.summary = summary
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let season = dict["season"] as? Int,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let summary = dict["summary"] as? String
            {
            self.init(name: name, season: season, number: number, airdate: airdate, summary: summary)
        }
        else {
            return nil
        }
    }
}
