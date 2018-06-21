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
        setNavigationBar()
        createTable()
        info()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.KGPurpleColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationBar(){
        title = "Games"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = false
        let closeButton = UIBarButtonItem(title: "Clear  Filters", style: .plain, target: self, action: #selector(self.close(_:)))
        self.navigationItem.rightBarButtonItem = closeButton
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func close(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func info() {
        do {
            let realm = try Realm()
            var predicate = NSPredicate()
            
            if sortingByCategory == "Popularity" {
                if rating == "5" && sortingByBrand == "" {
                   predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@ OR rating = %@ OR rating = %@", "5", "4", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "4" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@ OR rating = %@", "4", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "3" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "2" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "1" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "5" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "5", sortingByBrand, "4", sortingByBrand, "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "4" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "4", sortingByBrand, "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "3" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "2" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@",  "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "1" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@", "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "brand = %@", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }else if rating == "" && sortingByBrand == "" {
                    let games = realm.objects(Game.self)
                    self.games = games
                        .sorted { return ($0.downloads! > $1.downloads!) }
                        .map { return $0 }
                }
            }else if sortingByCategory == "New" {
                if rating == "5" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@ OR rating = %@ OR rating = %@", "5", "4", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "4" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@ OR rating = %@", "4", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "3" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "2" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "1" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "5" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "5", sortingByBrand, "4", sortingByBrand, "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "4" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "4", sortingByBrand, "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "3" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "2" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@",  "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "1" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@", "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "brand = %@", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }else if rating == "" && sortingByBrand == "" {
                    let games = realm.objects(Game.self)
                    self.games = games
                        .sorted { return ($0.createdAt! > $1.createdAt!) }
                        .map { return $0 }
                }
            }else if sortingByCategory == "Price" {
                if rating == "5" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@ OR rating = %@ OR rating = %@", "5", "4", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "4" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@ OR rating = %@", "4", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "3" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "2" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "1" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "5" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "5", sortingByBrand, "4", sortingByBrand, "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "4" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "4", sortingByBrand, "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "3" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "2" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@",  "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "1" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@", "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "brand = %@", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }else if rating == "" && sortingByBrand == "" {
                    let games = realm.objects(Game.self)
                    self.games = games
                        .sorted { return ($0.price! > $1.price!) }
                        .map { return $0 }
                }
            }else{
                if rating == "5" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@ OR rating = %@ OR rating = %@", "5", "4", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "4" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@ OR rating = %@", "4", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "3" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@ OR rating = %@", "3", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "2" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = %@ OR rating = %@", "2", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "1" && sortingByBrand == "" {
                    predicate = NSPredicate(format: "rating = 1", "1")
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "5" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "5", sortingByBrand, "4", sortingByBrand, "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "4" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "4", sortingByBrand, "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "3" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@ OR rating = %@ AND brand = %@", "3", sortingByBrand, "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "2" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@ OR rating = %@ AND brand = %@",  "2", sortingByBrand, "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "1" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "rating = %@ AND brand = %@", "1", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if rating == "" && sortingByBrand != "" {
                    predicate = NSPredicate(format: "brand = %@", sortingByBrand)
                    let games = realm.objects(Game.self).filter(predicate)
                    self.games = games.map { $0 }
                }else if sortingByCategory == "" && rating == "" && sortingByBrand == "" {
                    let games = realm.objects(Game.self)
                    self.games = games.map { $0 }
                }
            }
            

            filteredResultsLabel.text = "Filtered results (\(self.games.count))"
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
            
            _flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.0, height: 202)
            _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            _flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 0
            _flowLayout.sectionInset.right = 0
            _flowLayout.sectionInset.left = 0
            _flowLayout.sectionInset.top = 5
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
        let nextView = DetailViewController()
        nextView.game = games[indexPath.row]
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
