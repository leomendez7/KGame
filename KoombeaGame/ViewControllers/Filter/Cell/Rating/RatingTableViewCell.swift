//
//  RatingTableViewCell.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 21/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {

    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    var check = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(rating: Int) {
        switch rating {
        case 1:
            self.star1.image = #imageLiteral(resourceName: "starYellow")
            self.star2.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star3.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star4.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star5.image = #imageLiteral(resourceName: "starEmptyYellow")
            break
        case 2:
            self.star1.image = #imageLiteral(resourceName: "starYellow")
            self.star2.image = #imageLiteral(resourceName: "starYellow")
            self.star3.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star4.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star5.image = #imageLiteral(resourceName: "starEmptyYellow")
            break
        case 3:
            self.star1.image = #imageLiteral(resourceName: "starYellow")
            self.star2.image = #imageLiteral(resourceName: "starYellow")
            self.star3.image = #imageLiteral(resourceName: "starYellow")
            self.star4.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star5.image = #imageLiteral(resourceName: "starEmptyYellow")
            break
        case 4:
            self.star1.image = #imageLiteral(resourceName: "starYellow")
            self.star2.image = #imageLiteral(resourceName: "starYellow")
            self.star3.image = #imageLiteral(resourceName: "starYellow")
            self.star4.image = #imageLiteral(resourceName: "starYellow")
            self.star5.image = #imageLiteral(resourceName: "starEmptyYellow")
            break
        case 5:
            self.star1.image = #imageLiteral(resourceName: "starYellow")
            self.star2.image = #imageLiteral(resourceName: "starYellow")
            self.star3.image = #imageLiteral(resourceName: "starYellow")
            self.star4.image = #imageLiteral(resourceName: "starYellow")
            self.star5.image = #imageLiteral(resourceName: "starYellow")
            break
        default:
            self.star1.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star2.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star3.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star4.image = #imageLiteral(resourceName: "starEmptyYellow")
            self.star5.image = #imageLiteral(resourceName: "starEmptyYellow")
        }
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
