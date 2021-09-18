//
//  HomeTableViewCell.swift
//  Todo
//
//  Created by Makoto on 2021/09/14.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkButton.layer.cornerRadius = 25 / 2
        checkButton.layer.masksToBounds = true
    }
}
