//
//  GTODetailViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Ana Ma on 10/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GOTDetailViewController: UIViewController {
    var selectedEpisode: GOTEpisode!
    var urlLink: String?

    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var urlTextView: UITextView!
    @IBOutlet weak var originalImageView: UIImageView!
    
    
    /*
    self.id = id
    self.runtime = runtime
    self.season = season
    self.summary = summary
    self.url = url
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(for: selectedEpisode)
        // Do any additional setup after loading the view.
    }
    
    private func updateViews(for episode: GOTEpisode) {
        self.episodeTitleLabel.text = "Episode Name: \(episode.name)"
        self.detailLabel.text = "Episode Airdate: \(episode.airdate)"
        self.IDLabel.text = "ID: \(String(episode.id))"
        self.seasonLabel.text = "Season: \(String(episode.season))"
        self.runtimeLabel.text = "Runtime: \(String(episode.runtime))"
        urlLink = episode.url
        
        let url = URL(string: episode.originalImage)
        guard let data = try? Data(contentsOf: url!) else { return }
        //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        originalImageView.image = UIImage(data: data)
        
        //self.originalImageView.image = UIImage(data: checkedUrl)
        //http://stackoverflow.com/questions/25983558/stripping-out-html-tags-from-a-string
        
        // let updatedSummary = episode.summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        let updatedSummary = episode.summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        self.summaryTextView.text = "Summary: \(updatedSummary)"
        
       /*
        if let checkedUrl = URL(string: episode.originalImage) {
            originalImageView.contentMode = .scaleAspectFit
            downloadImage(url: checkedUrl)
        }
        */
    }
    
    
    @IBAction func urlButtonTapped(_ sender: UIButton) {
        guard let urlwebLink = urlLink else {return}
        guard let url = URL(string: urlwebLink) else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    //Create a method with a completion handler to get the image data from your url
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    //Create a method to download the image (start the task)
    //http://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            DispatchQueue.main.sync() { () -> Void in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                self.originalImageView.image = UIImage(data: data)
            }
        }
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
