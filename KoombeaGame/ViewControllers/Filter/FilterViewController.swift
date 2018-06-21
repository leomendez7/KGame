//
//  FilterViewController.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 21/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var headers = ["Sorting by","Rating","Sorting by"]
    var sortingBy = ["Popularity","New","Price"]
    var rating = [5,4,3,2,1]
    var sortingBy2 = ["Nintendo","PlayStation","Xbox"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        createTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNavigationBar(){
        title = "Filters"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.KGPurpleColor()
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.close(_:)))
        self.navigationItem.rightBarButtonItem = closeButton
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func close(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func createTable() {
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.register(UINib(nibName: "RatingTableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
        self.tableView.register(UINib(nibName: "SortingByTableViewCell", bundle: nil), forCellReuseIdentifier: "cell3")
        self.tableView.register(UINib(nibName: "ApplyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell4")
        self.tableView.register(UINib(nibName: "FilterHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 {
           return 60
        }else{
          return 44
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3 {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 5
        }else if section == 3{
            return 1
        }else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell:FilterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilterTableViewCell
            cell.nameLabel.text = sortingBy[indexPath.row]
            return cell
        case 1:
            let cell:RatingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! RatingTableViewCell
            cell.config(rating: rating[indexPath.row])
            return cell
        case 2:
            let cell:SortingByTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! SortingByTableViewCell
            cell.nameLabel.text = sortingBy2[indexPath.row]
            
            return cell
        default:
            let cell:ApplyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! ApplyTableViewCell
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:FilterHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! FilterHeader
        
        header.nameHeaderLabel.text = headers[section]
        
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}