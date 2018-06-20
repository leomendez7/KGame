//
//  DetailViewController.swift
//  KoombeaGame
//
//  Created by Cloud Technology Center on 20/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var skuLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var gameName2Label: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    var game : Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        info(game: game!)
        star(rating: game?.rating ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func info(game: Game) {
        self.gameNameLabel.text = game.name
        self.gameName2Label.text = game.name
        self.skuLabel.text = "SKU: \(game.SKU ?? "")"
        let numberFormatter = NumberFormatter()
        self.downloadLabel.text = "\(numberFormatter.stringColDecimal(Int(game.downloads ?? "0")! as NSNumber)) downloads"
        self.genreLabel.text = game.genre
        self.priceLabel.text = "$\(game.price ?? "0")"
        self.descriptionLabel.text = game.description_
        
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

    func star(rating: String) {
        
        switch rating {
        case "1":
            self.star1.image = #imageLiteral(resourceName: "star")
            self.star2.image = #imageLiteral(resourceName: "star2")
            self.star3.image = #imageLiteral(resourceName: "star2")
            self.star4.image = #imageLiteral(resourceName: "star2")
            self.star5.image = #imageLiteral(resourceName: "star2")
            break
        case "2":
            self.star1.image = #imageLiteral(resourceName: "star")
            self.star2.image = #imageLiteral(resourceName: "star")
            self.star3.image = #imageLiteral(resourceName: "star2")
            self.star4.image = #imageLiteral(resourceName: "star2")
            self.star5.image = #imageLiteral(resourceName: "star2")
            break
        case "3":
            self.star1.image = #imageLiteral(resourceName: "star")
            self.star2.image = #imageLiteral(resourceName: "star")
            self.star3.image = #imageLiteral(resourceName: "star")
            self.star4.image = #imageLiteral(resourceName: "star2")
            self.star5.image = #imageLiteral(resourceName: "star2")
            break
        case "4":
            self.star1.image = #imageLiteral(resourceName: "star")
            self.star2.image = #imageLiteral(resourceName: "star")
            self.star3.image = #imageLiteral(resourceName: "star")
            self.star4.image = #imageLiteral(resourceName: "star")
            self.star5.image = #imageLiteral(resourceName: "star2")
            break
        case "5":
            self.star1.image = #imageLiteral(resourceName: "star")
            self.star2.image = #imageLiteral(resourceName: "star")
            self.star3.image = #imageLiteral(resourceName: "star")
            self.star4.image = #imageLiteral(resourceName: "star")
            self.star5.image = #imageLiteral(resourceName: "star")
            break
        default:
            self.star1.image = #imageLiteral(resourceName: "star2")
            self.star2.image = #imageLiteral(resourceName: "star2")
            self.star3.image = #imageLiteral(resourceName: "star2")
            self.star4.image = #imageLiteral(resourceName: "star2")
            self.star5.image = #imageLiteral(resourceName: "star2")
        }
    }

}
