//
//  GOTEpisodeClass.swift
//  AC3.2-GameOfThrones
//
//  Created by Kareem James on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let airtime: String
    let id: Int
    let season: Int
    let summary: String
    let url: String
    let image: [String: String]
    var mediumImage: String? {
        get {
            return image["medium"]
        }
    }
    var originalImage: String? {
        get {
            return image["original"]
        }
    }
    
    init(name: String, number: Int, airdate: String, airtime: String, id: Int, season: Int, summary: String, url: String, image: [String: String]) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.airtime = airtime
        self.id = id
        self.season = season
        self.summary = summary
        self.url = url
        self.image = image
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let airtime = dict["airtime"] as? String,
            let id = dict["id"] as? Int,
            let season = dict["season"] as? Int,
            let summary = dict["summary"] as? String,
            let url = dict["url"] as? String,
            let image = dict["image"] as? [String: String]
        {
            
            self.init(name: name, number: number, airdate: airdate, airtime: airtime, id: id, season: season, summary: summary, url: url, image: image)
        }
        else {
            return nil
        }
    }
}
