//
//  DashboardTableViewCell2.swift
//  KoombeaGame
//
//  Created by Cloud Technology Center on 20/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class DashboardTableViewCell2: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var games: [Game] = []
    var count = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createTable()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension DashboardTableViewCell2: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionViewflowLayaout() {
        var flowLayout: UICollectionViewFlowLayout {
            let _flowLayout = UICollectionViewFlowLayout()
            
            // edit properties here
            _flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3.0, height: 195)
            _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            _flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 10
            _flowLayout.sectionInset.right = 10
            _flowLayout.sectionInset.left = 10
            _flowLayout.sectionInset.top = 0
            _flowLayout.sectionInset.bottom = 5
            // edit properties here
            
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
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath as IndexPath) as! DashboardCollectionViewCell2
        if games.count != 0 {
          cell.config(game: games[indexPath.row])
        }
        
        
        return cell
    }
}
