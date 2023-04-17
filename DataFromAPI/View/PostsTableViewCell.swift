//
//  PostsTableViewCell.swift
//  DataFromAPI
//
//  Created by Aqila Nasiry on 4/13/23.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        userIdLabel.layer.backgroundColor = UIColor.brown.cgColor
        userIdLabel.layer.masksToBounds = true
        userIdLabel.layer.cornerRadius = 5
    }


}
