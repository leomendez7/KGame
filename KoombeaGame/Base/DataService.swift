//
//  DataService.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 19/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class DataService {
    
    static let shared = DataService()
    
    var games = [Game]()
    
    
    func loadGame(_ contentBlock: @escaping (NSError?, [Game]?)->()){
        
        games.removeAll()
        let url = URL(string: "https://parseapi.back4app.com/classes/Product")
        
        let headers = [
            "X-Parse-Application-Id": "I9pG8SLhTzFA0ImFkXsEvQfXMYyn0MgDBNg10Aps",
            "X-Parse-REST-API-Key": "Yvd2eK2LODfwVmkjQVNzFXwd3N0X7oUuwiMI3VDZ"
        ]
        
        Alamofire.request(url!, method: .get, headers: headers).validate().responseJSON { response in
            
            switch response.result{
            case .success:
                if let value = response.result.value{
                    let json = JSON(value)
                    print(json)
                    do {
                        let realm = try Realm()
                        try realm.write {
                            realm.delete(realm.objects(Game.self))
                        }
                        
                        for  (_,subJson):(String, JSON) in json["results"] {
                            self.games.append(Game().gameFromJson(subJson))
                        }
                        
                        realm.beginWrite()
                        realm.add(self.games)
                        try realm.commitWrite()
                    } catch {
                        print(error.localizedDescription)
                    }
                    contentBlock(nil, self.games)
                }
            case .failure(let error):
                print(error.localizedDescription)
                contentBlock(error as NSError?, nil)
            }
        }
    }
}
