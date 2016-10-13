//
//  GOTepisode.swift
//  AC3.2-GameOfThrones
//
//  Created by Ilmira Estil on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class GOTEpisode {
    let name: String
    let number: Int
    let airdate: String
    let summary: String
    let url: String
    
    init(name: String, number: Int, airdate: String, summary: String, url: String) {
        self.name = name
        self.number = number
        self.airdate = airdate
        self.summary = summary
        self.url = url
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["name"] as? String,
            let number = dict["number"] as? Int,
            let airdate = dict["airdate"] as? String,
            let summary = dict["summary"] as? String,
            let imageName = dict["image"] as? [String : String],
            let url = imageName["original"] {
            self.init(name: name, number: number, airdate: airdate, summary: summary, url: url)
        }
        else {
            return nil
        }
    }
}
