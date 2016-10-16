//
//  GameOfThronesTableViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Jason Gresh on 10/11/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GameOfThronesTableViewController: UITableViewController {
    
    var episodes = [GOTEpisode]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "got", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let dict = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSDictionary else {
                return
        }
        
        if let episodes = dict?.value(forKeyPath: "_embedded.episodes") as? [[String:Any]] {
            for epDict in episodes {
                if let ep = GOTEpisode(withDict: epDict) {
                    self.episodes.append(ep)
                }
            }
        }
    }
    
    // MARK: - Helper function
    
    func bySeason(season: Int) -> [GOTEpisode] {
        let filtered = episodes.filter({a in
            a.season == season})
        return filtered
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        var numSeasons = 0
        for episode in episodes {
            if episode.season > numSeasons {
                numSeasons = episode.season
            }
        }
        return numSeasons
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bySeason(season: section+1).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! GOTTableViewCell
        let thisEpisode = bySeason(season: indexPath.section + 1)[indexPath.row]
        cell.textLabel?.text = thisEpisode.name
        cell.detailTextLabel?.text = thisEpisode.airdate
        
        cell.backgroundColor = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.textColor = UIColor.white
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tappedGOTCell = sender as? GOTTableViewCell{
            if segue.identifier == "ShowEpisodeDetailSegue" {
                let destination = segue.destination as! EpisodeDetailViewController
                let cellIndexPath = self.tableView.indexPath(for: tappedGOTCell)!
                let selectedGOTepisode: GOTEpisode = bySeason(season: cellIndexPath.section + 1)[cellIndexPath.row]
                destination.thisGOTEpisode = selectedGOTepisode
            }
        }
    }
}
