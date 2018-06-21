//
//  FilteringResultsViewController.swift
//  KoombeaGame
//
//  Created by Cloud Technology Center on 21/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit
import RealmSwift

class FilteringResultsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filteredResultsLabel: UILabel!
    
    var sortingByCategory = String()
    var rating = String()
    var sortingByBrand = String()
    var games = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createTable()
        info()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func info() {
        do {
            let realm = try Realm()
            let games = realm.objects(Game.self)
            self.games.removeAll()
            self.games = games.map { $0 }
            if sortingByCategory != "" && rating == "" && sortingByBrand == "" {
                
            }
            filteredResultsLabel.text = "Filtered results \(self.games.count)"
            self.collectionView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension FilteringResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionViewflowLayaout() {
        var flowLayout: UICollectionViewFlowLayout {
            let _flowLayout = UICollectionViewFlowLayout()
            
            _flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3.0, height: UIScreen.main.bounds.width / 3.0)
            _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            _flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 10
            _flowLayout.sectionInset.right = 10
            _flowLayout.sectionInset.left = 10
            _flowLayout.sectionInset.top = 0
            _flowLayout.sectionInset.bottom = 5
            
            return _flowLayout
        }
        self.collectionView.collectionViewLayout = flowLayout
    }
    
    func createTable() {
        self.collectionView.register(UINib(nibName: "DashboardCollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "cell2")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionViewflowLayaout()
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath as IndexPath) as! DashboardCollectionViewCell2
        if games.count != 0 {
            cell.config(game: games[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
