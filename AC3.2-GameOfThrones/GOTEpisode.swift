//
//  GOTEpisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Margaret Ikeda on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation
class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let summary: String
    let imageUrlString: String

    init(name: String,
         number: Int,
         airdate: String,
         summary: String,
         imageUrlString: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.summary = summary
        self.imageUrlString = imageUrlString
    }

    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let summary = dict["summary"] as? String,
            let imageDict = dict["image"] as? [String: String],
            let imageOriginal = imageDict["original"] {
            self.init(name: name,
                      number: number,
                      airdate: airdate,
                      summary: summary,
                      imageUrlString: imageOriginal)
        }
        else {
            return nil
        }
    }
}
