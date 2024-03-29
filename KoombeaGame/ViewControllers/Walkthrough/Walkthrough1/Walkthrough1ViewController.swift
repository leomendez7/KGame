//
//  Walkthrough1ViewController.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 19/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class Walkthrough1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func nextView(_ sender: Any) {
        let nextView = Walkthrough2ViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    

}
