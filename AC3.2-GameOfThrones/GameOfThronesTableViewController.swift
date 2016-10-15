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

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200.0
        
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
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.episodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTEpisode", for: indexPath)

//        if let movieCell: MovieTableViewCell = cell as? MovieTableViewCell {
//            movieCell.movieTitleLabel.text = data[indexPath.row].title
//            movieCell.movieSummaryLabel.text = data[indexPath.row].summary
//            movieCell.moviePosterImageView.image = UIImage(named: data[indexPath.row].poster)
//            return movieCell
//        }
        
        if let GOTEpisodeCell: GOTTableViewCell = cell as? GOTTableViewCell {
            let episode = self.episodes[indexPath.row]
            
            GOTEpisodeCell.GOTEpisodeNameLabel.text = episode.name
            GOTEpisodeCell.GOTEpisodeAirdateLabel.text = episode.summary
            GOTEpisodeCell.GOTPosterImage.image = UIImage(named: episode.mediumImage!)
            return GOTEpisodeCell
        }
            return cell
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedTitle = self.episodes[indexPath.row]
//        performSegue(withIdentifier: "GOTDetailSegue", sender: selectedTitle)
//    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "GOTDetailSegue" {
//            if let destination = segue.destination as? GOTDetailViewController {
//                destination.detailGOTData = sender as? GOTEpisode
//            }
//        }
//        
//    
//    }
    

}
