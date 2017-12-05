//
//  Utils.swift
//  AmBi
//
//  Created by Dreamup on 11/1/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class Utils {

   static func getCurrentTime() -> String {
        
        let cerrentTime = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: cerrentTime)
        let min = calendar.component(.minute, from: cerrentTime)
        
        let time = "\(hour):\(min)"
        
        return time
    }
    
    func getTimeStamp() -> CLong {
        
        
        return 1
    }

}
