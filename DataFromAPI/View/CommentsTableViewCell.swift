//
//  CommentsTableViewCell.swift
//  DataFromAPI
//
//  Created by Aqila Nasiry on 4/14/23.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
}
