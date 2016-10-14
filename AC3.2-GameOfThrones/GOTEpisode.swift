//
//  GOTEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Tom Seymour on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    
    let runtime: Int
    let season: Int
    let summary: String
    let id: Int
    let url: String
    let image: [String: String]
    var imageMedium: String? {
        get {
            return image["medium"]
        }
    }
    var imageOriginal: String? {
        get {
            return image["original"]
        }
    }
    
    init(name: String, number: Int, airdate: String, runtime: Int, season: Int, summary: String, id: Int, url: String, image: [String: String]) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.runtime = runtime
        self.season = season
        self.summary = summary
        self.id = id
        self.url = url
        self.image = image
        
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let runtime = dict["runtime"] as? Int,
            let season = dict["season"] as? Int,
            let summary = dict["summary"] as? String,
            let id = dict["id"] as? Int,
            let url = dict["url"] as? String,
            let image = dict["image"] as? [String: String]{
            self.init(name: name, number: number, airdate: airdate, runtime: runtime, season: season, summary: summary, id: id, url: url, image: image)
        }
        else {
            return nil
        }
    }
}
