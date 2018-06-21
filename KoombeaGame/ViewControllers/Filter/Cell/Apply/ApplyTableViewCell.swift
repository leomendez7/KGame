//
//  ApplyTableViewCell.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 21/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

protocol ApplyTableViewCellDelegate: class {
    func applyTableViewCellDidSelect()
}

class ApplyTableViewCell: UITableViewCell {

    var delegate : ApplyTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func apply(_ sender: Any) {
        delegate?.applyTableViewCellDidSelect()
    }
}
