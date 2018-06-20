//
//  Game.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 19/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Game: Object {

    @objc dynamic var objectId : String?
    @objc dynamic var name : String?
    @objc dynamic var brand : String?
    @objc dynamic var price : String?
    @objc dynamic var imageURL : String?
    @objc dynamic var genre : String?
    var popular : Bool?
    @objc dynamic var description_ : String?
    @objc dynamic var SKU : String?
    @objc dynamic var createdAt : String?
    @objc dynamic var updatedAt : String?
    
    func gameFromJson(_ json: JSON) -> Game {
        let game = Game()
        
        game.objectId = json["objectId"].stringValue
        game.name = json["name"].stringValue
        game.brand = json["brand"].stringValue
        game.price = json["price"].stringValue
        game.imageURL = json["imageURL"].stringValue
        game.genre = json["genre"].stringValue
        game.popular = json["popular"].boolValue
        game.description_ = json["description"].stringValue
        game.SKU = json["SKU"].stringValue
        game.createdAt = json["createdAt"].stringValue
        game.updatedAt = json["updatedAt"].stringValue
        
        return game
    }
    
}
