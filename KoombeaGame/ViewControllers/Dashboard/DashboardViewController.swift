//
//  DashboardViewController.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 19/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    var brands = ["All","Nintendo","PlayStation","Xbox", "PC"]
    var games = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        loadInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInfo(){
        ActivityIndicator.shared.startSpinnerAnimation(message: "Cargando...")
        DataService.shared.loadGame { (error, games) in
            if let e = error {
                print(e)
            }else {
                self.games = games.map { $0 }!
                self.collectionView2.reloadData()
            }
            ActivityIndicator.shared.stopSpinnerAnimation()
        }
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionViewflowLayaout() {
        var flowLayout: UICollectionViewFlowLayout {
            let _flowLayout = UICollectionViewFlowLayout()
            
            // edit properties here
            _flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.0, height: UIScreen.main.bounds.width / 3.0)
            _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            _flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 0
            _flowLayout.sectionInset.right = 0
            _flowLayout.sectionInset.left = 0
            _flowLayout.sectionInset.top = 0
            _flowLayout.sectionInset.bottom = 0
            // edit properties here
            
            return _flowLayout
        }
        self.collectionView.collectionViewLayout = flowLayout
    }
    
    func collectionViewflowLayaout2() {
        var flowLayout: UICollectionViewFlowLayout {
            let _flowLayout = UICollectionViewFlowLayout()
            
            // edit properties here
            _flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 4.0, height: UIScreen.main.bounds.width / 1.0)
            _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            _flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 0
            _flowLayout.sectionInset.right = 0
            _flowLayout.sectionInset.left = 0
            _flowLayout.sectionInset.top = 0
            _flowLayout.sectionInset.bottom = 0
            // edit properties here
            
            return _flowLayout
        }
        self.collectionView2.collectionViewLayout = flowLayout
    }
    
    func createTable() {
        self.collectionView.register(UINib(nibName: "DashboardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionViewflowLayaout()
        self.collectionView.reloadData()
        
        self.collectionView2.register(UINib(nibName: "DashboardCollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "cell2")
        self.collectionView2.dataSource = self
        self.collectionView2.delegate = self
        self.collectionViewflowLayaout2()
        self.collectionView2.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView {
            return self.brands.count
        }else {
            switch section {
            case 0:
                return 5
            case 1:
                return 5
            default:
                return self.games.count
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView2 {
            return 3
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! DashboardCollectionViewCell
            
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath as IndexPath) as! DashboardCollectionViewCell2
            switch indexPath.section {
            case 0:
                if games.count != 0 {
                  cell.config(game: games[indexPath.row])
                }
                
            case 1:
                if games.count != 0 {
                    cell.config(game: games[indexPath.row])
                }
            default:
                if games.count != 0 {
                    cell.config(game: games[indexPath.row])
                }
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
