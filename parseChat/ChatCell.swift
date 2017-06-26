//
//  ChatCell.swift
//  parseChat
//
//  Created by Claire Chen on 6/26/17.
//  Copyright © 2017 Alina + Claire. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    //Variables
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
