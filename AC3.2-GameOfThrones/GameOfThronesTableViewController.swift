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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "got", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let dict = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSDictionary else { return }
        if let episodes = dict?.value(forKeyPath: "_embedded.episodes") as? [[String:Any]] {
            for epDict in episodes {
                if let ep = GOTEpisode(withDict: epDict) {
                    self.episodes.append(ep)
                }
            }
        }
    }
    
    func seasonCounter() -> Int {
        var maxSeasonNumber = 0
        for episode in episodes {
            if episode.season > maxSeasonNumber {
                maxSeasonNumber = episode.season
            }
        }
        return maxSeasonNumber
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return seasonCounter()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let seasonNumber = section + 1
        let seasonArray = episodes.filter { $0.season == seasonNumber }
        return seasonArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let seasonNumber = indexPath.section + 1
        let episodesBySeason: [GOTEpisode] = episodes.filter { $0.season == seasonNumber }
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpDetailCell", for: indexPath) as! GOTEpDetailTableViewCell
        let thisEpisode = episodesBySeason[indexPath.row]
        
        cell.textLabel?.text = thisEpisode.name
        cell.detailTextLabel?.text = "Episode \(thisEpisode.number),  first aired: \(thisEpisode.airdate)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let seasonNumber = indexPath.section + 1
        let episodesBySeason: [GOTEpisode] = episodes.filter { $0.season == seasonNumber }
        let selectedEpisode = episodesBySeason[indexPath.row]
        performSegue(withIdentifier: "GOTEpDetailSegue", sender: selectedEpisode)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GOTEpDetailSegue" {
            let destinationViewController = segue.destination as! GOTEpDetailViewController
            let thisEpisode = sender as! GOTEpisode
            destinationViewController.thisGOTEpisode = thisEpisode
        }
    }
}
