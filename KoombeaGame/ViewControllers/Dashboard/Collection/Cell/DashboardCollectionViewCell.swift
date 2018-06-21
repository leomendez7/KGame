//
//  DashboardCollectionViewCell.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 20/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit
import AlamofireImage

class DashboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var brandButton: UIButton!
    
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var brandView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(name: String){
//        brandButton.setTitle(name, for: .normal)
//        brandButton.layer.cornerRadius = 5
        brandLabel.text = name
        brandView.layer.cornerRadius = 10

    }

    @IBAction func changeBrand(_ sender: Any) {
        
    }
    
    
}
