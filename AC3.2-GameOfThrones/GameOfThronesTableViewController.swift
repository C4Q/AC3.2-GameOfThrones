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
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // lets say section = 0
        // when it's in section 3
        let seasonEpisode = episodes.filter({ ($0.season - 1) == section })
        return seasonEpisode.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let seasonEpisodes = episodes.filter({ ($0.season - 1) == indexPath.section })
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTEidentifier", for: indexPath)
        
        let episode = seasonEpisodes[indexPath.row]
        cell.textLabel?.text = episode.name
        cell.detailTextLabel?.text = episode.airdate

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = episodes[indexPath.row]
        performSegue(withIdentifier: "GOTEidentifier", sender: episode)
    }


       // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController. Pass the selected object to the new view controller.
        if segue.identifier == "GOTEidentifier" {
            let destinationVC = segue.destination as? MovieViewController
            destinationVC?.episode = sender as? GOTEpisode
        }
    }

}
