//
//  GOTViewController.swift
//  AC3.2-GameOfThrones
//
//  Created by Margaret Ikeda on 10/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GOTViewController: UIViewController {
    @IBOutlet weak var episodeDetailLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var episodeSummaryLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!

//    // How to turn load an image from a URL
//
    var episodeImage: UIImage?
    var data: Data?
//
//
//    //1. Create a url from the string of the url

//
//    //2. Create a data object out of the url
//    if let unwrappedURL = url {
//        data = try? Data.init(contentsOf: unwrappedURL)
//    }
//
//    //3. Create an image out of the data object created
//    if let realData = data {
//        image = UIImage(data: realData)
//    }

    var detailEpisode: GOTEpisode?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailEpisode = detailEpisode else { return }

        let summaryWithoutTags = detailEpisode.summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)

        episodeDetailLabel.text = "\(detailEpisode.name)"
        episodeNumberLabel.text = "\(detailEpisode.number)"
        episodeSummaryLabel.text = "\(summaryWithoutTags)"
        episodeImage = UIImage.image(forUrlString: detailEpisode.imageUrlString)
        episodeImageView.image = episodeImage
    }


    // Do any additional setup after loading the view.
}

private extension UIImage {
    class func image(forUrlString urlString: String) -> UIImage? {

        guard let url = URL(string: urlString),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) else { return nil }

        return image
    }
}
