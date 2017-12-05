//
//  MenuService.swift
//  AmBi
//
//  Created by Dreamup on 12/5/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit
import UIKit
import Alamofire
import ObjectMapper

class MenuService {

    class func getFavouriteIdeal(completion : @escaping (_ response: ServerResponse) -> (), fail: @escaping (Error) -> Void) -> Void {

        ServiceFactory.get(url: Constants.GetFavouriteIdeal) { (response) in
            if response.result.isSuccess, response.response?.statusCode == 200 {
                if let serverResponse = Mapper<ServerResponse>().map(JSONObject: response.result.value) {
                    if serverResponse.code == 0 {
                        
                        completion(serverResponse)
                    } else {
                        
                        completion(serverResponse)
                    }}
            }
        }
        
    }

    class func login(id: String, password: String, completion : @escaping (_ response: ServerResponse) -> (), fail: @escaping (Error) -> Void) -> Void {
        
        let parameters = [
            "id": id,
            "password": password
        ]
        
        ServiceFactory.post(url: Constants.Login, parameters: parameters) { response in
            if response.result.isSuccess, response.response?.statusCode == 200 {
                if let serverResponse = Mapper<ServerResponse>().map(JSONObject: response.result.value) {
                    if serverResponse.code == 0 {
                        completion(serverResponse)
                    } else {
                        completion(serverResponse)
                    }
                }
            } else {
                if let error = response.result.error {
                    fail(error)
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: nil)
                    fail(error)
                }
            }
            
        }
    }

}
