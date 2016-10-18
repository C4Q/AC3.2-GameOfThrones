//
//  GotEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Cris on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let runtime: Int
    let airdate: String
    let season: Int
    let summary: String
    
    init(name: String, number: Int, runtime: Int, airdate: String, season: Int, summary: String) {
        self.name = name
        self.number = number
        self.runtime = runtime
        self.airdate = airdate
        self.season = season
        self.summary = summary
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let runtime = dict["runtime"] as? Int,
            let airdate = dict["airdate"] as? String,
            let season = dict["season"] as? Int,
            let summary = dict["summary"] as? String {
            self.init(name: name, number: number, runtime: runtime, airdate: airdate, season: season, summary: summary)
        }
        else {
            return nil
        }
    }
}
