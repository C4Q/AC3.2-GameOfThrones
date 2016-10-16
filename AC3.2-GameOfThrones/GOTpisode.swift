//
//  GTOEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Ana Ma on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

/*
{
    "_links": {
        "self": {
            "href": "http://api.tvmaze.com/episodes/4952"
        }
    },
    "airdate": "2011-04-17",
    "airstamp": "2011-04-17T21:00:00-04:00",
    "airtime": "21:00",
    "id": 4952,
    "image": {
        "medium": "http://tvmazecdn.com/uploads/images/medium_landscape/1/2668.jpg",
        "original": "http://tvmazecdn.com/uploads/images/original_untouched/1/2668.jpg"
    },
    "name": "Winter is Coming",
    "number": 1,
    "runtime": 60,
    "season": 1,
    "summary": "<p>Lord Eddard Stark, ruler of the North, is summoned to court by his old friend, King Robert Baratheon, to serve as the King's Hand. Eddard reluctantly agrees after learning of a possible threat to the King's life. Eddard's bastard son Jon Snow must make a painful decision about his own future, while in the distant east Viserys Targaryen plots to reclaim his father's throne, usurped by Robert, by selling his sister in marriage.</p>",
    "url": "http://www.tvmaze.com/episodes/4952/game-of-thrones-1x01-winter-is-coming"
}
 
*/


class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let id: Int
    let runtime: Int
    let season: Int
    let summary: String
    let url: String
    let mediumImage: String
    let originalImage: String
    
    init(name: String, number: Int, airdate: String, id: Int, runtime: Int, season: Int, summary: String, url: String, mediumImage: String, originalImage: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.id = id
        self.runtime = runtime
        self.season = season
        self.summary = summary
        self.url = url
        self.originalImage = originalImage
        self.mediumImage = originalImage
    
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let id = dict["id"] as? Int,
            let runtime = dict["runtime"] as? Int,
            let season = dict["season"] as? Int,
            let summary =  dict["summary"] as? String,
            let url = dict["url"] as? String,
            let imageDict = dict["image"] as? [String:Any],
            let mediumImage = imageDict["medium"] as? String,
            let originalImage = imageDict["original"] as? String {
            self.init(name: name, number: number, airdate: airdate, id: id, runtime: runtime, season: season, summary: summary, url: url, mediumImage: mediumImage, originalImage: originalImage)
        }
        else {
            return nil
        }
    }
}


