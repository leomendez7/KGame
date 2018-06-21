//
//  SortingByTableViewCell.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 21/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class SortingByTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var radioButton: UIButton!
    
    var check = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func check(_ sender: Any) {
        if !check{
            check = !check
            let checkImage: UIImage? = #imageLiteral(resourceName: "radio-on-button (1)").withRenderingMode(.alwaysOriginal)
            radioButton.setImage(checkImage, for: .normal)
        }else{
            check = !check
            let checkImage: UIImage? = #imageLiteral(resourceName: "emptyCircle").withRenderingMode(.alwaysOriginal)
            radioButton.setImage(checkImage, for: .normal)
        }
    }
}
