//
//  DetailViewController.swift
//  KoombeaGame
//
//  Created by Cloud Technology Center on 20/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit
import Tamamushi
import UIColor_Hex_Swift

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
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        info(game: game!)
        star(rating: game?.rating ?? "")
        tapGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
        navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
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
    
    func tapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ShowImage(tapGestureRecognizer:)))
        gameImageView.isUserInteractionEnabled = true
        gameImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func ShowImage(tapGestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            let vc = ImageDetailsViewController()
            vc.urlImg = self.game?.imageURL ?? ""
            self.present(vc, animated: true, completion: nil)
        })
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIView {
    
    func applyGradientEfectInBackground(colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        layer.insertSublayer(gradient, at: 0)
    }
    
}
