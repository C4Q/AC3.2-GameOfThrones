//
//  GameOfThronesTableViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Jason Gresh on 10/11/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GameOfThronesTableViewController: UITableViewController {
    
    /* Be sure to make all the connections between the Table View in the storyboard and the code:
     
     The class name in the identity inspector must match your view controller's class.
     The reuse identifier in the storyboard and in cellForRowAt must agree.
     The cell type should not be custom.
     Populate the table with titles and the airdate as the detail title.
     
     Create your own detail view controller to open when selected. Be sure to:
     
     Create the segue in the storyboard
     Implement prepare(for:) passing one GOTEpisode object to your detail.
     You have flexibility with what you want to display and how you want to display it. If you just want to practice Table Views and segues then you'll be done re-displaying the title in the detail.
     Challenge #1. Use autolayout to build a nice detail page.
     Challenge #2. Grab more data out of the JSON to build a richer detail page. You'll still be extracting the data on the table view page but you won't be displaying it.
    */
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 7
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodes.filter({$0.season - 1 == section}).count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let season = episodes.filter({ ($0.season - 1) == indexPath.section })
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCellIdentifier", for: indexPath)
        cell.detailTextLabel?.text = season[indexPath.row].airdate
        cell.textLabel?.text = season[indexPath.row].name
        // Configure the cell...

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tappedGOTCell : GOTTableViewCell = sender as? GOTTableViewCell{
            if segue.identifier == "GOTDetailViewControllerSegue" {
                let GOTDetailViewController: GOTDetailViewController = segue.destination as! GOTDetailViewController
                let cellIndexPath = self.tableView.indexPath(for: tappedGOTCell)!
                let selectedGOTepisode: GOTEpisode = episodes[cellIndexPath.row]
                GOTDetailViewController.selectedEpisode = selectedGOTepisode
            }
        }
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
