//
//  HomeTableViewCell.swift
//  Todo
//
//  Created by Makoto on 2021/09/14.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkImageView: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkImageView.layer.cornerRadius = 25 / 2
        checkImageView.layer.masksToBounds = true
    }
}
