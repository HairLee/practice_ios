//
//  Consants.swift
//  AmBi
//
//  Created by Dreamup on 10/19/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let buttonActiveColor = UIColor.orange
let buttonInActiveColor = UIColor.gray
let textHightLight = UIColor.orange
let backgroundCellSelectedColor = UIColor.gray
let baseURL = "http://icue.iptime.org:9991/api/v1"
class Constants {
    struct Domain {
        static let Testing = "http://icue.iptime.org:9991/api/v1"
        static let Staging = "http://10.0.0.2:8080"
        static let Production = "http://10.0.0.2:8080"
    }
    
    //Favourite
    static let GetFavouriteIdeal = baseURL + "/menu/ideal"
    static let Login = baseURL + "/login"
    
    struct Parameter {
        // headers
        static let Accept = "Accept"
        static let ApplicationJson = "application/json"
        static let AccessTokenType = "access-token"
        static let ContentType = "Content-Type"
        static let FormUrlEncoded = "application/x-www-form-urlencoded"
        static let MultiPartFormData = "multipart/form-data"
        
        // params
        static let Name = "name"
        static let UserName = "username"
        static let Email = "email"
        static let Password = "password"
    }
}
