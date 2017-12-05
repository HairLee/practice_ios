//
//  Preferences.swift
//  AmBi
//
//  Created by Dreamup on 10/19/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit



class Preferences {

    class func setAccessToken(_ token: String) -> Void {
        let preferences = UserDefaults.standard
        preferences.set(token,forKey: "Consants.UserDefaultsKey.AccessToken")
        preferences.synchronize()
    }
    
    class func getAccessToken() -> String {
        let token = UserDefaults.standard.string(forKey: "Consants.UserDefaultsKey.AccessToken")
        return token ?? ""
    }
    

}
