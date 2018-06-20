//
//  DashboardTableViewCell.swift
//  KoombeaGame
//
//  Created by Cloud Technology Center on 20/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var brands = ["All","Nintendo","PlayStation","Xbox", "PC"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createTable()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DashboardTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionViewflowLayaout() {
        var flowLayout: UICollectionViewFlowLayout {
            let _flowLayout = UICollectionViewFlowLayout()
            
            // edit properties here
            _flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3.0, height: UIScreen.main.bounds.width / 3.0)
            _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            _flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 10
            _flowLayout.sectionInset.right = 10
            _flowLayout.sectionInset.left = 10
            _flowLayout.sectionInset.top = 10
            _flowLayout.sectionInset.bottom = 10
            // edit properties here
            
            return _flowLayout
        }
        self.collectionView.collectionViewLayout = flowLayout
    }
    
    func createTable() {
        self.collectionView.register(UINib(nibName: "DashboardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionViewflowLayaout()
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! DashboardCollectionViewCell
        
        cell.config(name: self.brands[indexPath.row])
        
        return cell
    }
}
