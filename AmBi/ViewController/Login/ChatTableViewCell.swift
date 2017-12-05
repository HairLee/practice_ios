//
//  ChatTableViewCell.swift
//  AmBi
//
//  Created by Dreamup on 10/27/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bidingData(room:Room){
        lbNameOfRoom.text = room.nameOfRoom
        lbLastMessage.text = room.messageList[room.messageList-1].me
        
    }
}
