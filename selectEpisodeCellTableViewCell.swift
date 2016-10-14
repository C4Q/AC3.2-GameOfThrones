//
//  selectEpisodeCellTableViewCell.swift
//  AC3.2-GameOfThrones
//
//  Created by Marty Avedon on 10/14/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class selectEpisodeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
