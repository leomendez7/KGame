//
//  DashboardCollectionViewCell2.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 20/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class DashboardCollectionViewCell2: UICollectionViewCell {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var nameGameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(game: Game) {
        nameGameLabel.text = game.name
        gameImageView.layer.cornerRadius = 6
        
        guard let urlImage = game.imageURL else {
            return
        }
        
        let newUrl = urlImage.replacingOccurrences(of: "\\", with: "", options: .literal, range: nil) 
        
        if urlImage != "" {
            guard let safeURL = newUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
                return
            }
            guard let url = URL(string: safeURL) else {
                return
            }
            var placeholderImage = UIImage()
            placeholderImage = #imageLiteral(resourceName: "noArticles")
            gameImageView.af_setImage(withURL: url, placeholderImage: placeholderImage, imageTransition: .crossDissolve(0.2))
        }else{
            gameImageView.image = #imageLiteral(resourceName: "noArticles")
        }
    }

}
