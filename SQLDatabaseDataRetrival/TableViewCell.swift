//
//  TableViewCell.swift
//  SQLDatabaseDataRetrival
//
//  Created by Nikhil Patil on 19/03/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //Table View Cell Variables
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var professionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
