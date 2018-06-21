//
//  FilterTableViewCell.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 21/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

protocol FilterTableViewCellDelegate: class {
    func filterTableViewCellDidSelect(category: String, moreOrLess: Bool)
}

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var radioButton: UIButton!
    
    var check = false
    var delegate: FilterTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(category: String) {
        self.nameLabel.text = category
    }
    
    
    @IBAction func check(_ sender: Any) {
        if !check{
            check = !check
            let checkImage: UIImage? = #imageLiteral(resourceName: "radio-on-button (1)").withRenderingMode(.alwaysOriginal)
            radioButton.setImage(checkImage, for: .normal)
            delegate?.filterTableViewCellDidSelect(category: self.nameLabel.text!, moreOrLess: true)
        }else{
            check = !check
            let checkImage: UIImage? = #imageLiteral(resourceName: "emptyCircle").withRenderingMode(.alwaysOriginal)
            radioButton.setImage(checkImage, for: .normal)
            delegate?.filterTableViewCellDidSelect(category: self.nameLabel.text!, moreOrLess: false)
        }
    }
    
}
