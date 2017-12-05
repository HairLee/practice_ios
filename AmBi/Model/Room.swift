//
//  Room.swift
//  AmBi
//
//  Created by Dreamup on 10/26/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit
import RealmSwift

class Room:Object {
    
    @objc dynamic var id = 0
    @objc dynamic var nameOfRoom = ""
    @objc dynamic var timeStamp:Double = 0
    var messageList = List<Message>()
    
    
    
}

