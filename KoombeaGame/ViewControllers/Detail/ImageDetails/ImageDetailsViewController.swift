//
//  ImageDetailsViewController.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 19/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageDetailsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var imageDetail: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var closeButton: UIButton!
    
    var urlImg = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.layer.cornerRadius = 17.5
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
        
        guard let safeURL = urlImg.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return
        }
        guard let url = URL(string: safeURL) else {
            return
        }
        let placeholderImage = #imageLiteral(resourceName: "noArticles")
        imageDetail.af_setImage(withURL: (url as URL?)!, placeholderImage: placeholderImage, imageTransition: .crossDissolve(0.2))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageDetail
    }
    
    @IBAction func closeImage(_ sender: Any) {
        UIView.animate(withDuration: 0.9, animations: {
            //UIApplication.shared.isStatusBarHidden = false
            self.dismiss(animated: true, completion: nil)
        })
    }
    
}
