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
    var selectedEp: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        view.backgroundColor = UIColor.blue
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get selected episode and perform segue
        
        selectedEp = self.episodes[indexPath.row] //need self?
        performSegue(withIdentifier: "GOTSegue", sender: selectedEp)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTcell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = episodes[indexPath.row].name
        cell.detailTextLabel?.text = episodes[indexPath.row].airdate
        
        
        return cell
    }
    /*
     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     switch section {
     case 0:
     tableView.title
     }
     
     
     
     */


//MARK: Functions

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







// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    if segue.identifier == "GOTSegue" {
        if let gvc = segue.destination as? GOTDetailViewController {
            gvc.stupidEpisode = selectedEp
        }
    }
}


}
