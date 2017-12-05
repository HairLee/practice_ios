//
//  Constant.swift
//  QClub
//
//  Created by Dream on 9/14/17.
//  Copyright © 2017 Dream. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let buttonActiveColor = UIColor.init(hexString: "#e86a12")
let buttonInActiveColor = UIColor.init(hexString: "#bdbdbd")
let textHightLight = UIColor.init(hexString: "#e86a12")
let backgroundCellSelectedColor = UIColor.init(hexString: "#ffaa4f")

class Constants {
    struct Domain {
        static let Testing = "http://icue.iptime.org:9991/api/v1"
        static let Staging = "http://10.0.0.2:8080"
        static let Production = "http://10.0.0.2:8080"
    }
    
    struct API {
        
        #if QCLUB_PLATFORM_TESTING
        static let baseURL = Domain.Testing
        #elseif QCLUB_PLATFORM_STAGING
        static let baseURL = Domain.Staging
        #elseif QCLUB_PLATFORM_PRODUCTION
        static let baseURL = Domain.Production
        #endif
        
        // authentication APIs
        static let InsertUpdateUser = baseURL + "/user"
        static let CheckDuplicateId = baseURL + "/duplication/id"
        static let CheckDuplicateMobile = baseURL + "/duplication/mobile"
        static let CheckDuplicateNickname = baseURL + "/duplication/nickname"
        static let FindId = baseURL + "/find/id"
        static let FindPassword = baseURL + "/find/password"
        static let Login = baseURL + "/login"
        static let ValidateIdBeforeLogin = baseURL + "/login/validate"
        static let FindRecommenderById = baseURL + "/recommender"
        
        // Menu
        // Notice
        static let GetNotices = baseURL + "/menu/notification"
        
        //Holding
          static let GetHolding = baseURL + "/menu/holding"
        
              
        //Store
        static let GetStore = baseURL + "/menu/store"
        
        // Fqa api
        static let GetFqaList = baseURL + "/menu/faq"
        
        
        // agreemment
        static let GetAgreement = baseURL + "/menu/agreement"
        
        // Match api
        static let GetMatchTodayList = baseURL + "/match/today/list"
        static let GetMatchTodayChoice = baseURL + "/match/today/choice"
        static let GetMatchSpecialRegist = baseURL + "/match/special/regist"
        static let GetMatchSpecialList = baseURL + "/match/special/list"
        static let GetMatchSpecialChoice = baseURL + "/match/special/choice"
        static let GetMatchCustomizedList = baseURL + "/match/customized/list"
        static let GetTodayMore = baseURL + "/match/today/more"
        
        // Profile api
        static let GetProfileBasic = baseURL + "/profile/basic"
        
        // Report api
        static let Report = baseURL + "/report/user"
        
    }
    
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
    
    // UserDefaults Keys
    struct UserDefaultsKey {
        static let AccessToken = "AccessToken"
        static let UserLogin = "UserLogin"
    }
}

