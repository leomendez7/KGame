//
//  DashboardViewController.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 19/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var headers = ["","New","Poluar","All"]
    var games = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        createTable()
        loadInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.black
        let rightBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        let leftBarButton = UIBarButtonItem(title: "Game", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func loadInfo(){
        ActivityIndicator.shared.startSpinnerAnimation(message: "Loading...")
        DataService.shared.loadGame { (error, games) in
            if let e = error {
                print(e)
            }else {
                self.games = games.map { $0 }!
                self.tableView.reloadData()
            }
            ActivityIndicator.shared.stopSpinnerAnimation()
        }
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func createTable() {
        self.tableView.register(UINib(nibName: "DashboardTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.register(UINib(nibName: "DashboardTableViewCell2", bundle: nil), forCellReuseIdentifier: "cell2")
        self.tableView.register(UINib(nibName: "Header", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 55
        }else{
            return 175
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.tableView(tableView, heightForHeaderInSection:section)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell:DashboardTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DashboardTableViewCell
            
            return cell
        }else{
            let cell:DashboardTableViewCell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! DashboardTableViewCell2
            cell.delegate = self
            switch indexPath.section {
            case 1:
                let new = games.sorted { $0.createdAt! < $1.createdAt! }
                cell.games = new
                cell.count = 5
                cell.collectionView.reloadData()
            case 2:
                let popular = games.filter { $0.popular == true }
                cell.games = popular
                cell.count = popular.count
                cell.collectionView.reloadData()
            default:
                 cell.games = self.games
                 cell.count = self.games.count
                cell.collectionView.reloadData()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:Header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! Header
        header.nameHeaderLabel.text = headers[section]
        
        switch section {
        case 1:
            header.nameHeaderLabel.text = "\(headers[section]) (5)"
        case 2:
            let popular = games.filter { $0.popular == true }
            header.nameHeaderLabel.text = "\(headers[section]) (\(popular.count))"
        default:
            header.nameHeaderLabel.text = "\(headers[section]) (\(self.games.count))"
        }
        return header
    }
    
}

extension DashboardViewController: DashboardTableViewCell2Delegate {
    
    func DashboardTableViewCell2DidSelect(game: Game) {
        let nextView = DetailViewController()
        nextView.game = game
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
