//
//  Database.swift
//  AmBi
//
//  Created by Dreamup on 10/26/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit
import RealmSwift


class Database {


    static func insertRoomsMessage(room:Room){
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(room)
            print("added ! \(room.nameOfRoom) to Realm")
        }
        
    }
    

}
