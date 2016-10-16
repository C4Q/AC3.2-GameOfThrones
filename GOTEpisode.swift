//
//  GOTEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Madushani Lekam Wasam Liyanage on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let summary: String
    let imageURL: String
    let season: Int
    
    init(name: String, number: Int, airdate: String, summary: String, imageURL: String, season: Int) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.summary = summary
        self.imageURL = imageURL
        self.season = season
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let summary = dict["summary"] as? String,
            let imageDict = dict["image"] as? [String:String], let imageURL = imageDict["original"],
            let season = dict["season"] as? Int {
            
            let summWithoutTags = summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            self.init(name: name, number: number, airdate: airdate, summary: summWithoutTags, imageURL: imageURL, season: season)
        }
        else {
            return nil
        }
    }
}
