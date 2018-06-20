//
//  Session.swift
//  KoombeaGame
//
//  Created by Leonardo Mendez on 19/06/18.
//  Copyright © 2018 Leonardo Mendez. All rights reserved.
//

import Foundation

class Session: NSObject {

    class func sessionViewed() -> Bool?{
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "viewed") as? Bool
    }
    
    class func saveSessionViewed(sessionToken: Bool!){
        let defaults = UserDefaults.standard
        defaults.set(sessionToken, forKey: "viewed")
    }
    
}
