//
//  Chat.swift
//  AmBi
//
//  Created by Dreamup on 10/26/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class Chat: NSObject {

    var contentMessage:String = ""
    var timeMessage:String = ""
    var isFriend:Bool = false
    
    init(pContent:String, pTime:String, pFriend:Bool) {
       contentMessage = pContent
        timeMessage = pTime
        isFriend = pFriend
    }
    

}
